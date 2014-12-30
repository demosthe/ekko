class RelationshipsController < ApplicationController
  #before_action :signed_in_user
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to @user, notice: "You are now following #{@user.username}"
  end

  def destroy
    @user = User.find(params[:relationship][:followed_id])
    current_user.unfollow!(@user)
    redirect_to @user, notice: "You just unfollowed #{@user.username}"
  end
end
