class EscapadesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @escapades = Escapade.all
  end

  def show
    @escapade = Escapade.find(params[:id])
    if @escapade.status == 'event'
      @commits = @escapade.commits
      @current_commit = current_user.commits & @commits
      @commit = Commit.new
      render 'show_event'
    end
    @responses = @escapade.responses
    @response = current_user.responses & @escapade.responses
    @optimal_dates = get_optimal_dates @escapade
  end

  def new
    @escapade = Escapade.new
  end

  def create
    @escapade = current_user.escapades.new(escapade_params)
    if @escapade.save
      flash[:notice] = "You have successfully posted your new idea!"
      redirect_to escapade_path(@escapade)
    else
      render :new
    end
  end

  def edit
    @escapade = Escapade.find(params[:id])
  end

  def update
    @escapade = Escapade.find(params[:id])
    if @escapade.update(escapade_params)
      flash[:notice] = "You have successfully updated your idea!"
      redirect_to escapade_path(@escapade)
    else
      render :edit
    end
  end

  def destroy
    Escapade.find(params[:id]).destroy
    redirect_to escapades_path
  end

  def add_commit
    @escapade = Escapade.find(params[:id])
    @escapade.commits.create(user: current_user)
    flash[:notice] = "You have committed to this event"
    redirect_to escapade_path(@escapade)
  end

  def remove_commit
    @escapade = Escapade.find(params[:id])
    @escapade.commits.where(user: current_user).destroy_all
    redirect_to escapade_path(@escapade)
  end



  private
  def escapade_params
    params.require(:escapade).permit(:title, :image, :description, :start_date, :end_date, :status).merge(user_id: current_user.id)
  end
end
