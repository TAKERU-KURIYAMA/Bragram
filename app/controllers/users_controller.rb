class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
