class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session, :authenticate_user_from_token!

  def destroy_session
    request.session_options[:skip] = true
  end

  private
  def authenticate_user_from_token!
    if !params['token']
      error = {
        error: "Authorization needs api token in params...",
        code: 400
      }
      render :json => error, :status => :bad_params
    else
      @user = nil
      User.find_each do |u|
        if Devise.secure_compare(u.token, params['token'])
          @user = u
        end
      end
      error = {
        error: "Invalid Token",
        code: 401
      }
      if @user == nil
        render :json => error, :status => :unauthorized
      end
    end
  end
end
