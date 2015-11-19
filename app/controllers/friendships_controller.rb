class FriendshipsController < ApplicationController

  def create
    current_user.friendships.create(friend_id: params[:friend_id])
    flash[:notice] = "You have added #{User.find(params[:friend_id]).email} as your friend!"
    redirect_to user_path(current_user)
  end

  def destroy
    Friendship.find()
  end
end
