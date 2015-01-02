class EkkosController < ApplicationController
  def show
  end

  def index
    user_hash = @user_client.get('/me')
    @username = user_hash.username
    @ekkos = @user_client.get("/me/tracks")

    #for every user that I am following
    #  get their ekkos
    #  add their ekkos to @ekkos

    user_hash = @client.get('/resolve',
               url: 'https://soundcloud.com/csocut/')
    user_tracks_hash = @client.get("/users/#{user_hash['id']}/tracks")
    #first_track_id = user_tracks_hash.first['id']
    @ekkos << user_tracks_hash.first
  end
end
