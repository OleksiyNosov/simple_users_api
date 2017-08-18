class UsersController < ApplicationController

  private
  def resource
    @user ||= User.find params[:id]
  end

  def build_resource
    @user = User.new resource_params
  end

  def resource_params
    params.require(:user).permit(:name, :email)
  end

  def collection
    @users ||= User.all
  end
end