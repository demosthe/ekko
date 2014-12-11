class EkkosController < ApplicationController
  def show
  end

  def index
    client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
    @tracks = client.get('/tracks', :limit => 10, :order => 'hotness')
    # print each link
    #@echos = Echo.all
  end
end
