class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @users = User.all
    @book = Book.new
  	@user = User.find(params[:id])
    @books = @user.books
  end

  def create
    if @user.save
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to user_path(@user), notice: "successfully updated user!"
    else
      flash[:notice] = 'error'
      render :edit
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end