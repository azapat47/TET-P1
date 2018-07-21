class MainController < ApplicationController
  before_action :set_coordinate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /coordinates
  # GET /coordinates.json
  def home
    @coordinates = Coordinate.where("user=?",current_user.id)
  end
end
