class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def update
  end
  
  def create
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
