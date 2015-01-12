class EkkosController < ApplicationController
  def show
  end

  def index
    @ekkos = @user_client.get("/me/tracks")

    current_user.followed_users.each do |user|
      user_hash = @client.get("/resolve",
                              url: "https://soundcloud.com/#{user.username}/")
      user_tracks_hash = @client.get("/users/#{user_hash['id']}/tracks")
      @ekkos.concat(user_tracks_hash)
    end

    @ekkos.sort! { |a,b| b['id'] <=> a['id'] }
    @ekkos = @ekkos.paginate(page: params[:page], per_page: 4)
  end
end
