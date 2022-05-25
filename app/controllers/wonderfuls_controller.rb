class WonderfulsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    wonderful = current_user.wonderfuls.new(post_id: post.id)
    wonderful.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    wonderful = current_user.wonderfuls.find_by(post_id: post.id)
    wonderful.destroy
    redirect_to post_path(post)
  end
end
