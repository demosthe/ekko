class EchosController < ApplicationController
  def show
  end

  def index
    @echos = Echo.all
  end
end
