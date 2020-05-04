class FavoriteHobbiesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    hobby = Hobby.find(params[:hobby_id])
    current_user.favorite_hobby(hobby)
    flash[:success] = '趣味を"気になる"しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    hobby = Hobby.find(params[:hobby_id])
    current_user.unfavorite_hobby(hobby)
    flash[:success] = '"気になる"を解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
