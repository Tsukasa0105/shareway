class FavoriteWaysController < ApplicationController
   before_action :require_user_logged_in
  
  def create
    way = Way.find(params[:way_id])
    current_user.favorite_way(way)
    flash[:success] = '楽しみ方を"気になる"しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    way = Way.find(params[:way_id])
    current_user.unfavorite_way(way)
    flash[:success] = '"気になる"を解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
