class ResponsesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @escapade = Escapade.find(params[:escapade_id])
    @response = Response.find(params[:id])
    @availability = Availability.new
  end

  def create
    @escapade = Escapade.find(params[:escapade_id])
    @response = @escapade.responses.new(escapade_id: @escapade.id, user_id: current_user.id)
    redirect_to escapade_response_path(@escapade, @response)
  end

  def edit
    @escapade = Escapade.find(params[:escapade_id])
    @response = Response.find(params[:id])
  end

  def update
    @escapade = Escapade.find(params[:escapade_id])
    @response = Response.find(params[:id])
    if @response.update(response_params)
      flash[:notice] = "You have successfully updated your response"
      redirect_to escapade_response_path(@escapade, @response)
    else
      render :edit
    end
  end

  def destroy
    @escapade = Escapade.find(params[:escapade_id])
    @response = Response.find(params[:id])
    @response.destroy
    flash[:notice] = "You have removed your availability for this idea"
    redirect_to escapade_path(@escapade)
  end


  private
  def response_params
    params.require(:response).permit(:comment, :start_date, :end_date).merge(user_id: current_user.id)
  end
end
