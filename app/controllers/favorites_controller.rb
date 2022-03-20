class FavoritesController < ApplicationController

  def create
    holiday = Holiday.find(params[:holiday_id])
    @favorite = current_user.favorites.new(holiday_id: holiday.id)
    @favorite.save
    holiday.create_notification_like!(current_user)
  end

  def destroy
    holiday = Holiday.find(params[:holiday_id])
    @favorite = current_user.favorites.find_by(holiday_id: holiday.id)
    @favorite.destroy
  end

end
