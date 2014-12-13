class EkkosController < ApplicationController
  def show
  end

  def index
    user_hash = @user_client.get('/me')
    @username = user_hash.username

    @user_tracks = @user_client.get("/me/tracks")
  end
end
