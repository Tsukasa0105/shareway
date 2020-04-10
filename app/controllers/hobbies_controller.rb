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
      @hobbies = current_user.hobbies.order(id: :desc).page(params[:page])
      flash.now[:danger] = '登録に失敗しました。'
      redirect_to new_hobby_path
    end
  end
  
  def destroy
    @hobby.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def hobby_params
    params.require(:hobby).permit(:name)
  end
end