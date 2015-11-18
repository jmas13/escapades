require 'pry'
class CommitsController < ApplicationController

  def create
    binding.pry
    @escapade = Escapade.find(params[:escapade_id])
    commit = Commit.create(commit_params)
    flash[:notice] = "You have committed to this event"
    redirect_to escapade_path(@escapade)
  end

  private
  def commit_params
    params.require(:commit).permits(:status, :escapade_id).merge(user_id: current_user.id)
  end


end
