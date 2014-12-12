class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_soundcloud_client
  def setup_soundcloud_client
    @client = SoundCloud.new(:client_id => ENV['soundcloud_client_id'])
  end

  before_action :login_soundcloud_user
  def login_soundcloud_user
    @user_client = SoundCloud.new({
      :client_id     => ENV['soundcloud_client_id'],
      :client_secret => ENV['soundcloud_client_secret'],
      :username      => ENV['soundcloud_username'],
      :password      => ENV['soundcloud_password']
    })
  end
end
