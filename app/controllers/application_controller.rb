class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :find_current_user
  attr_reader :current_user
  helper_method :current_user

  private

  def find_current_user
    return unless cookies.signed[:user_id]
    @current_user = User.find_by(id: cookies.signed[:user_id])
  end

  # def require_current_user
  #   redirect_to '/auth/developer' unless current_user
  # end
end
