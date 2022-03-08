class HolidaysController < ApplicationController
  def new
  end

  def index
    @new_holiday = Holiday.new
    @holidays = Holiday.all
  end

  def create
    @new_holiday = Holiday.new(holiday_params)
    @new_holiday.user_id = current_user.id
    if @new_holiday.save
      redirect_to holidays_path
    else
      @holidays = Holiday.all
      render :index
    end
  end

  def show
    @new_holiday = Holiday.new
    @holiday = Holiday.find(params[:id])
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    redirect_to holidays_path
  end

  private

  def holiday_params
    params.require(:holiday).permit(:content, :image_id)
  end

end
