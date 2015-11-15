class EscapadesController < ApplicationController

  def index
    @escapades = Escapade.all
  end

  def show
    @escapade = Escapade.find(params[:id])
    @responses = @escapade.responses
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

  private
  def escapade_params
    params.require(:escapade).permit(:title, :image, :description, :start_date, :end_date)
  end
end
