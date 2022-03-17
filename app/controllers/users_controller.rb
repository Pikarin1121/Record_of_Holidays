class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @holidays = @user.holidays.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:notice] = "権限なし"
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image_id, :birthday, :introduction)
  end
end
