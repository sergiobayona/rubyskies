class MainController < ApplicationController
  def index
    @weather = Weather.new
  end
end
