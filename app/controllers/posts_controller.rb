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

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Updated"
    else
      redirect_to post_path(@post), notice: "Couldn't Update"
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_index_path, notice: "deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list, :published)
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

end
