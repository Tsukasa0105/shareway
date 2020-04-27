class WaysController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]
  before_action :require_user_logged_in, only: [:index, :show, :new, :edit, :search]

  def index
    @like_ways=current_user.like_ways.order(id: :desc).page(params[:page])
    @like_hobbies=current_user.like_hobbies.order(id: :desc).page(params[:page])
=begin
    @like_ways_each_hobby = @like_ways.group(:hobby_id).order('count(hobby_id) desc')
    @like_ways_each_hobby_count = @like_ways_each_hobby.count
=end
  end

  def show
    @way = Way.find(params[:id])
    @user = @way.user
    @comments = @way.comments
    @comment = @way.comments.build
  end
  def new
    @way = Way.new
  end

  def create
    @way = current_user.ways.build(way_params)

    if @way.save
      flash[:success] = '投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def update
    @way = Way.find(params[:id])
    if @way.update(way_params)
      flash[:success] = '変更しました'
      redirect_to root_path
    else
      flash.now[:danger] = '変更に失敗しました'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @way.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to root_url
  end
  
  def search 
    @ways = Way.search(params[:search])
  end
  
  private
  
  def way_params
    params.require(:way).permit(:name, :hobby_id, :image, :content)
  end
  
  def correct_user
    @way = current_user.ways.find_by(id: params[:id])
    unless @way
      redirect_to root_url
    end
  end
end

