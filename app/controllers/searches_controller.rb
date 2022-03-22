class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.all.search(params[:keyword])
    else
      if params[:latest]
        @holidays = Holiday.all.search(params[:keyword]).order(created_at: :desc)
      elsif params[:favorite]
        @holidays = Holiday.all.search(params[:keyword]).includes(:favorites).sort{|a,b| b.favorites.size <=> a.favorites.size}
      else
        @holidays = Holiday.all.search(params[:keyword]).order(created_at: :desc)
      end
      #@holidays = Holiday.all.search(params[:keyword]).includes(:favorites).sort{|a,b| b.favorites.size <=> a.favorites.size}
    end
  end
end
