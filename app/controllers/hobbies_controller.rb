class HobbiesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @hobbies = Hobby.all.page(params[:page])
  end
  
  def new
    @hobby = Hobby.new
  end
  
  def create
    @hobby = Hobby.find_or_initialize_by(hobby_params)
    if @hobby.save
      flash[:success] = '登録しました。'
      redirect_to new_way_path
    else
      flash.now[:warning] = '趣味を入力してください。'
      render :new 
    end
  end
  
  def destroy
    @hobby.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def hobby_ways
    @hobby = Hobby.find(params[:id])
    @ways = Way.where(id: @hobby.id)
  end
  
  private
  
  def hobby_params
    params.require(:hobby).permit(:name)
  end
end