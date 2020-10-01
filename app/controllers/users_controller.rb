class UsersController < ApplicationController
  def index

  end

  def new
    
  end

  def create
    User.create(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :)
  end
end
