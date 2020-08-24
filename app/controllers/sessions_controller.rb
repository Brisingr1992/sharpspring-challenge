class SessionsController < ApplicationController
  before_action :redirect, only: [:new, :create]
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to notes_path, notice: "Logged in!"
    else
      redirect_to new_session_path, alert: "Email or password is invalid"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
