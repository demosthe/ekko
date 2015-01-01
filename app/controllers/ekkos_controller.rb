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
  end
end
