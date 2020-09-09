class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @videoposts = @user.videoposts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to @user
    else
      flash[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    
    unless @user == current_user
      redirect_to root_url
    end
    
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to @user
    else
      flash.now[:danger] = "プロフィールは更新されませんでした。"
      render :edit
    end
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
  
  def profiles
    @user = User.find(params[:id])
  end
  
  private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :genre, :phonenumber, :adress, :img, :placeofactivity, :hobby, :sex, :camera, :lens, :app )
end

end

