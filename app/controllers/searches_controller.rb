class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.all.search(params[:keyword])
    else
      #ソート機能の設定
      if params[:latest]
        @holidays = Holiday.all.search(params[:keyword]).order(created_at: :desc)
      elsif params[:favorite]
        #1つの投稿につきユーザーは1いいねしかできないため、includes(:favorites)でよい
        @holidays = Holiday.search(params[:keyword]).includes(:favorites).sort{|a,b| b.favorites.size <=> a.favorites.size}
      else
        @holidays = Holiday.all.search(params[:keyword]).order(created_at: :desc)
      end
      #@holidays = Holiday.all.search(params[:keyword]).includes(:favorites).sort{|a,b| b.favorites.size <=> a.favorites.size}
    end
  end
end
