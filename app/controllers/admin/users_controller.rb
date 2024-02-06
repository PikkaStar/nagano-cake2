class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_user, only: [:show, :edit, :update]
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :address, :postal_code, :is_active)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
