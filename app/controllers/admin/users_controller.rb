class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroyable_by?(current_user)
      @user.destroy
      flash[:notice] = "User account deleted"
      redirect_to admin_users_path
    end
  end
end
