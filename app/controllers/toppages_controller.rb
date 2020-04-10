class ToppagesController < ApplicationController
  
  include SessionsHelper
  
  def index
    if logged_in?
      @ways=current_user.feed_ways.order(id: :desc).page(params[:page]).per(10)
      @all_ways_ranks = Way.find(FavoriteWay.group(:way_id).order('count(way_id) desc').limit(3).pluck(:way_id))
      @all_hobbies_ranks = Hobby.find(FavoriteHobby.group(:hobby_id).order('count(hobby_id) desc').limit(3).pluck(:hobby_id))
    end
  end
  
  def ways_ranking
    @all_ways_ranks = Way.find(FavoriteWay.group(:way_id).order('count(way_id) desc').pluck(:way_id))
  end
  
  def hobbies_ranking
    @all_hobbies_ranks = Hobby.find(FavoriteHobby.group(:hobby_id).order('count(hobby_id) desc').pluck(:hobby_id))
  end
end
