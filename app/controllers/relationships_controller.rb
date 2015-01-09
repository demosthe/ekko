class RelationshipsController < ApplicationController
  def create
    followed_id = params[:relationship][:followed_id]
    @user = User.find(followed_id)
    current_user.follow!(@user)

    redirect_to @user, notice: "You are now following #{@user.username}"
  end

  def destroy
    @user = User.find(params[:relationship][:followed_id])
    current_user.unfollow!(@user)
    redirect_to @user, notice: "You just unfollowed #{@user.username}"
  end
end
