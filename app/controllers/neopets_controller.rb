class NeopetsController < ApplicationController

  def index
    @neopets = Neopet.all
    @user = User.find(params[:id])
  end


  def new
    @neopet = Neopet.new
  end

  def show
    @neopet = Neopet.find(params[:id])
  end

  def create
    @neopet = Neopet.create(neopet_params(:name,:vegan))
    redirect_to neopet_path(@neopet)
  end

  def edit
    @neopet = Neopet.find(params[:pet_id])
    @user = User.find(params[:id])
  end

  def update
    @neopet = Neopet.find(params[:pet_id])
    @user = User.find(params[:id])
    @neopet.user = @user
    @user.neopets << @neopet
    # binding.pry
    redirect_to user_path(@user)
  end

  def delete
    @neopet = Neopet.find(params[:id])
    @neopet.destroy
    redirect_to neopets_path
  end

  private

  def neopet_params(*args)
    params.require(:neopet).permit(args)
  end



end
