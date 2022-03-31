class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  # indexアクションに関して、これは新規登録画面でエラーメッセージがでたページでリロードすると出てしまうエラー対策として記述
  def index
    redirect_to new_user_registration_path
  end

  def show
    @user = User.find(params[:id])
    @holidays = @user.holidays.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    # 他のユーザーの編集画面に遷移できないようにする
    unless @user == current_user
      redirect_to user_path(current_user.id), alert: '権限がありません'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報を更新しました'
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

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:holiday_id)
    @favorite_holidays = Holiday.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image_id, :birthday, :introduction)
  end

end
