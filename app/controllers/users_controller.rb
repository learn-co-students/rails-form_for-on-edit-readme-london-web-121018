class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params(:name))
    redirect_to neopet_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = User.update(user_params(:name))
    redirect_to neopet_path(@user)
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to neopets_path
  end

  private

  def user_params(*args)
    params.require(:user).permit(args)
  end

end
