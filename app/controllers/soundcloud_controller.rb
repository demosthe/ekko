class SoundcloudController < ApplicationController
  def search
  end

  def users
    @soundcloud_users = @client.get('/users',
                                 q: params["query"])
  end
end
