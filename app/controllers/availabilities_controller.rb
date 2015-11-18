class AvailabilitiesController < ApplicationController

  def create
    response = Response.find(params[:availability][:response_id])
    availability = Availability.new(availability_params)
    availability.response_id = response.id
    if availability.save
      flash[:notice] = "You have successfully added your availability"
    end
      redirect_to escapade_response_path(response.escapade, response)
  end

  def edit
    @availability = Availability.find(params[:id])
  end

  def update
    @availability = Availability.find(params[:id])
    if @availability.update(availability_params)
      flash[:notice] = "You have successfuly updated your availability"
    end
      redirect_to escapade_response_path(@availability.response.escapade, @availability.response)
  end

  private
  def availability_params
    params.require(:availability).permit(:start_date, :end_date)
  end

end
