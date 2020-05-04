class EnjoyedWaysController < ApplicationController
   before_action :require_user_logged_in
  
  def create
    way = Way.find(params[:way_id])
    current_user.enjoyed_way(way)
    flash[:success] = '楽しみ方を"満足"しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    way = Way.find(params[:way_id])
    current_user.unenjoyed_way(way)
    flash[:success] = '"満足"を解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
