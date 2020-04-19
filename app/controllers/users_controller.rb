class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
    @followings = @user.followings.limit(3)
    @followers = @user.followers.limit(3)
    @favorite_hobbies = @user.like_hobbies.limit(3)
    @favorite_ways = @user.like_ways.limit(3)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.new(user_params)
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を変更しました'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザー情報の変更に失敗しました'
      render :edit
    end
  end

  def destroy
    @user.destroy

    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end

  def destroy
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def like_hobbies
    @user = User.find(params[:id])
    @like_hobbies = @user.like_hobbies.page(params[:page])
    counts(@user)
  end
  
  def like_ways
    @user = User.find(params[:id])
    @like_ways = @user.like_ways.page(params[:page])
    counts(@user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
