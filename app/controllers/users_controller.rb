class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_user_name params[:name]
  end
  
  def add_follower
    user = User.find_by_id params[:user_id]
    user.add_follower params[:id]
    redirect_to :back
  end
  
  def remove_follower
    user = User.find_by_id params[:user_id]
    user.remove_follower params[:id]
    redirect_to :back
  end
  
end
