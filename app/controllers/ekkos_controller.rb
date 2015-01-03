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
                            url: 'https://soundcloud.com/lords-recovery-cdo/')
    user_tracks_hash =
      @client.get("/users/#{user_hash['id']}/tracks")

    @ekkos = @ekkos.concat(user_tracks_hash).
      paginate(page: params[:page], per_page: 7)
  end
end
