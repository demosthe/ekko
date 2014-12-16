class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :setup_soundcloud_client
  before_action :login_soundcloud_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # general soundsound client
  def setup_soundcloud_client
    @client = SoundCloud.new(:client_id => ENV['soundcloud_client_id'])
  end

  # user soundcloud client
  def login_soundcloud_user
    @user_client = SoundCloud.new({
      :client_id     => ENV['soundcloud_client_id'],
      :client_secret => ENV['soundcloud_client_secret'],
      :username      => ENV['soundcloud_username'],
      :password      => ENV['soundcloud_password']
    })
  end
end
