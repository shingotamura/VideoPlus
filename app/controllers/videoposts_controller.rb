class VideopostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def show
    
  end
  
  def new
    if logged_in?
       @videopost = current_user.videoposts.build
    end
  end
  
  def create
    @videopost = current_user.videoposts.build(videopost_params)
    if @videopost.save
      flash[:success] = 'ポートフォリオを更新しました'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'ポートフォリオの更新に失敗しました。'
      render :new
    end
  end

  def destroy
    @videopost.destroy
    flash[:success] = 'ポートフォリオを削除しました。'
    redirect_back(fallback_location: user_path(current_user))
  end
  
  private
  
  def videopost_params
    params.require(:videopost).permit(:youtube_title, :youtube_url)
  end
  
  def correct_user
    @videopost = current_user.videoposts.find_by(id: params[:id])
    unless @videopost
      redirect_to root_url
      
    end
  end
end

