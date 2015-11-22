class FriendshipsController < ApplicationController

  def create
    @friend = User.find(params[:friend_id])
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "You have added #{@friend.email} as your friend!"
    end
    redirect_to user_path(@friend)
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if current_user == @friendship.user_id
      @friend = User.find(@friendship.friend_id)
    else
      @friend = User.find(@friendship.user_id)
    end
    @friendship.destroy
    flash[:notice] = "You have removed #{@friend.email} from your friends"
    redirect_to user_path(current_user)
  end
end
