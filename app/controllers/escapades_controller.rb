class EscapadesController < ApplicationController

  def index
    @escapades = Escapade.all
  end

  def show
    @escapade = Escapade.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
