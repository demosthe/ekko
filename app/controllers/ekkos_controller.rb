class EkkosController < ApplicationController
  def show
  end

  def index
    @username = @user_client.get('/me').username

    @top_tracks = @client.get('/tracks', :limit => 10, :order => 'hotness')
  end
end
