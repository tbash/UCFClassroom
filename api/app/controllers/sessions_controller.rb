class SessionsController < ApplicationController

  def create
    @user = User.find_by(nid: params[:nid]).try(:authenticate, params[:password])

    if @user
      @user.authentication_token = SecureRandom.hex
      @user.save!
      
      render json: { access_token: @user.authentication_token, token_type: "bearer" }
    else
      render json: { error: "Invalid Username or Password" }, status: 401
    end
  end
end
