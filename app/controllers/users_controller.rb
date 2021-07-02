class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @users_tvits = current_user.tvits.latest
  end
end