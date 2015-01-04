class EkkosController < ApplicationController
  def show
  end

  def index
    @ekkos = @user_client.get("/me/tracks")

    # algorithm: for every user that I am following
    #  get their ekkos
    #  add their ekkos to @ekkos

    user_hash = @client.get('/resolve',
                            url: 'https://soundcloud.com/lords-recovery-cdo/')
    user_tracks_hash =
      @client.get("/users/#{user_hash['id']}/tracks")

    @ekkos.concat(user_tracks_hash)

    @ekkos.sort! { |a,b| b['id'] <=> a['id'] }

    @ekkos = @ekkos.paginate(page: params[:page], per_page: 7)
  end
end
