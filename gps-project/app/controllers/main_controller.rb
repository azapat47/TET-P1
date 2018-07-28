class MainController < ApplicationController
  before_action :set_coordinate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

#  render :template => 'google/show'
  # GET /coordinates
  # GET /coordinates.json
  def home
    @coordinates = Coordinate.where("user_id=?",current_user.id)
    if @coordinates.empty?
      @centerLatitude = 6.199733
      @centerLongitude = -75.578686
    else
      @centerLatitude = @coordinates.first.latitude
      @centerLongitude = @coordinates.first.longitude
    end
  end
end
