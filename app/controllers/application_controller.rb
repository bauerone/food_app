class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent

  helper_method :current_user

  before_action :require_login

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  private

  def require_login
    redirect_to root_path unless current_user
  end
end
