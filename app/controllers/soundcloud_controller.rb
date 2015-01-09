class SoundcloudController < ApplicationController
  def search
  end

  def users
    @soundcloud_users = @client.get('/users',
                                 q: params["query"])
  end

  def import_user
    user = User.new(soundcloud_id: params[:soundcloud_id])
    user.username = params[:username]
    user.password = ENV["default_user_password"]
    user.email = "importfromsoundcloud@fake.com"
    user.save!

    redirect_to :back
  end
end
