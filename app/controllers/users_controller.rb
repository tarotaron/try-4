class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update,:show,:index]
  before_action :correct_user, only: [:edit,:update]

  def edit
    @user = current_user
  end

  def update
     @user = User.find(params[:id])
      if @user.update(user_params)
    redirect_to user_path(@user)
     flash[:notice] = "You have updated user successfully."
      else
     render 'edit'
      end

  end

  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

   private
  def user_params
    params.require(:user).permit(:name, :profile_image)

  end
  def correct_user
  user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to user_path(current_user)
    end
end
end
