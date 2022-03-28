class HolidaysController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_holiday = Holiday.new
    @holidays = Holiday.all.order(created_at: :desc)
  end

  def create
    @new_holiday = Holiday.new(holiday_params)
    @new_holiday.user_id = current_user.id
    if @new_holiday.save
      redirect_to holidays_path, notice: '投稿が完了しました'
    else
      @holidays = Holiday.all
      render :index
    end
  end

  def show
    @holiday = Holiday.find(params[:id])
    @holiday_comment = HolidayComment.new
     @holyday_comment_error = HolidayComment.new
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    redirect_to holidays_path, notice: '休日記録を削除しました'
  end

  private

  def holiday_params
    params.require(:holiday).permit(:content, :image_id)
  end

end
