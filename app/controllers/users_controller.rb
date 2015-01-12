class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def search
  end

  def index
    @users = User.all
  end

  def following
    user = current_user
    @users = user.followed_users
  end
end
