class HomesController < ApplicationController
  before_action :set_q, only: [:top, :search]
  def top
    @tags = ActsAsTaggableOn::Tag.all
    @posts = Post.all
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    end
  end

  def search
    @results = @q.result.includes(:user)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com',name: 'guest',login_ID: 'guestlogin') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end

  def set_q
    @q = Post.ransack(params[:q])
  end
end
