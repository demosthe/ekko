class EkkosController < ApplicationController
  def show
  end

  def index
    #todo: get only public tracks
    @ekkos = @client.get("/me/tracks")

    current_user.followed_users.each do |user|
      user_tracks_hash = @client.get("/users/#{user.soundcloud_id}/tracks")
      @ekkos.concat(user_tracks_hash)
    end

    @ekkos.delete_if {|ekko| ekko.sharing != "public"}

    #@ekkos.sort! { |a,b| b['id'] <=> a['id'] }
    @ekkos = @ekkos.paginate(page: params[:page], per_page: 4)
  end
end
