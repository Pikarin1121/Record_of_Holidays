class FavoritesController < ApplicationController

  def create
    holiday = Holiday.find(params[:holiday_id])
    @favorite = current_user.favorites.new(holiday_id: holiday.id)
    @favorite.save
  end

  def destroy
    holiday = Holiday.find(params[:holiday_id])
    @favorite = current_user.favorites.find_by(holiday_id: holiday.id)
    @favorite.destroy
  end

end
