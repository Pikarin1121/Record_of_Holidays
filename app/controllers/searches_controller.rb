class SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "User"
      @users = User.all.search(params[:keyword])
    else
      @holidays = Holiday.all.search(params[:keyword])
    end
  end
end
