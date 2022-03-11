class FavoritesController < ApplicationController

  def create
    holiday = Holiday.find(params[:holiday_id])
    favorite = current_user.favorites.new(holiday_id: holiday.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    holiday = Holiday.find(params[:holiday_id])
    favorite = current_user.favorites.find_by(holiday_id: holiday.id)
    favorite.destroy
    redirect_to request.referer
  end

end
