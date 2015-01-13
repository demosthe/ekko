class EkkosController < ApplicationController
  def show
  end

  def index
    @ekkos = @user_client.get("/me/tracks")

    current_user.followed_users.each do |user|
      user_tracks_hash = @client.get("/users/#{user.soundcloud_id}/tracks")
      @ekkos.concat(user_tracks_hash)
    end

    @ekkos.sort! { |a,b| b['id'] <=> a['id'] }
    @ekkos = @ekkos.paginate(page: params[:page], per_page: 4)
  end
end
