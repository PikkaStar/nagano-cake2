class User::UsersController < ApplicationController
  before_action :my_user
  before_action :authenticate_user!
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private
  def my_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :phone_number, :address)
  end

end
