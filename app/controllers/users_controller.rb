class UsersController < ApplicationController
  def index
    @users = User.retrieve_company_users(current_user)
  end

  def show
    @user = User.find(params[:id])
  end
end
