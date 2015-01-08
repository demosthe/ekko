class RelationshipsController < ApplicationController
  #before_action :signed_in_user
  def create
    soundcloud_id = params["soundcloud_id"]

    if soundcloud_id.nil?
      followed_id = params[:relationship][:followed_id]
      @user = User.find(followed_id)
    else
      user = User.find_or_initialize_by(soundcloud_id: soundcloud_id)
      # todo: pass in username
      user.username = params["username"]
      user.password = ENV["default_user_password"]
      user.email = "fakemail@gmail.con"
      user.save!
      @user = user
    end

    current_user.follow!(@user)

    redirect_to @user, notice: "You are now following #{@user.username}"
  end

  def destroy
    @user = User.find(params[:relationship][:followed_id])
    current_user.unfollow!(@user)
    redirect_to @user, notice: "You just unfollowed #{@user.username}"
  end
end
