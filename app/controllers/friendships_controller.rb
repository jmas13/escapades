class FriendshipsController < ApplicationController

  def create
    @friend = User.find(params[:friend_id])
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.save
    flash[:notice] = "You have added #{@friend.email} as your friend!"
    redirect_to user_path(@friend)
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friend = User.find(@friendship.friend_id)
    @friendship.destroy
    flash[:notice] = "You have removed #{@friend.email} from your friends"
    redirect_to user_path(current_user)
  end
end
