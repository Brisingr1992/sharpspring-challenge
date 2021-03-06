class ApplicationController < ActionController::Base

  private

  def redirect
    redirect_to notes_url if current_user.present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end
end