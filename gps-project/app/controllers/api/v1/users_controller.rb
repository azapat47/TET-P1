class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User.all
    respond_to do |format|
      format.json { render :json => @users.to_json, :status => :ok}
    end
  end
end
