require 'pry'
class CommitsController < ApplicationController

  def create
    commit = Commit.create(commit_params)
    commit.update(escapade_id: params[:escapade_id])
    flash[:notice] = "You have committed to this event"
    redirect_to escapade_path(commit.escapade.id)
  end

  def destroy
    @commit = Commit.find(params[:id])
    @commit.destroy
    flash[:notice] = "You have removed yourself from this event's attendees"
  end



  private
  def commit_params
    params.require(:new_commit).permit(:status).merge(user_id: current_user.id)
  end


end
