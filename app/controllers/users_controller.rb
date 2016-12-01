class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => [:new_index,:show]

  def index
    @users = User.all
  end
  def new_index
    @users=User.where("role='1'").all
  end
  def show
    @user = User.find(params[:id])
    unless current_user.admin? or current_user.ip_committee? 
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin? or current_user.ip_committee?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role,:ip_assets_attributes,:posts_attributes)
  end

end
