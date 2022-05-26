class PostsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def index
    @posts = Post.all
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    end
  end
  
  def search
    @results = @q.result.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "タイトルと本文を入力してください"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
     @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_index_path, notice: "投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end
  
  def set_q
    @q = Post.ransack(params[:q])
  end
  
end
