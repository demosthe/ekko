class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :setup_soundcloud_client

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # user soundcloud client
  def setup_soundcloud_client
    @client = SoundCloud.new({
      :client_id     => ENV['soundcloud_client_id'],
      :client_secret => ENV['soundcloud_client_secret'],
      :username      => ENV['soundcloud_username'],
      :password      => ENV['soundcloud_password']
    })
  end
end
