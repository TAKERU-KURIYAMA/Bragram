class RaresController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    rares = current_user.rares.new(post_id: post.id)
    rares.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    rares = current_user.rares.find_by(post_id: post.id)
    rares.destroy
    redirect_to post_path(post)
  end
end
