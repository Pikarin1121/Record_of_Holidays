class HolidayCommentsController < ApplicationController
  before_action :authenticate_user!
  
  # indexアクションに関して、コメントできずにエラーメッセージが出る画面でリロードするとエラーを吐くのでその対策
  def index
    holiday = Holiday.find(params[:holiday_id])
    redirect_to holiday_path(holiday)
  end

  def create
    holiday = Holiday.find(params[:holiday_id])
    comment = current_user.holiday_comments.new(holiday_comment_params)
    comment.holiday_id = holiday.id
    if comment.save
      holiday.create_notification_holiday_comment!(current_user, comment.id)
      redirect_to holiday_path(holiday), notice: 'コメントを送信しました'
    else
      @holiday = Holiday.find(params[:holiday_id])
      @holiday_comment = HolidayComment.new
      @holyday_comment_error = comment
      render 'holidays/show'
    end
  end

  def destroy
    HolidayComment.find(params[:id]).destroy
    redirect_to holiday_path(params[:holiday_id]), notice: 'あなたのコメントを削除しました'
  end

  private

  def holiday_comment_params
    params.require(:holiday_comment).permit(:comment, :image_id)
  end

end
