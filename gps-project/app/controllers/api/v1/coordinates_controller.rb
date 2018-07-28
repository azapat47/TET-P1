class Api::V1::CoordinatesController < Api::V1::BaseController
  def index
    @coordinates = @user.coordinates.all
    respond_to do |format|
      format.json { render :json => @coordinates.to_json, :status => :ok}
    end
  end

  def create
    info = request.body.read()
    @coordinate = @user.coordinates.new(JSON.parse(info))
    if @coordinate.save
      render json: @coordinate, status: :created
    else
      render json: @coordinate.errors, status: :unprocessable_creation
    end
  end

  def update
  end

  def destroy
  end

  def show
  end
end
