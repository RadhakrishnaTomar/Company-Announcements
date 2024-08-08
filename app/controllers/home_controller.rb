class HomeController < ApplicationController

  def index
  end

  def user_show
    @user = User.find(params[:id])
  end

  def users_index
    @users = User.where.not(id: current_user.id)
  end

end
