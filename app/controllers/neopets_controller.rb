class NeopetsController < ApplicationController

  def index
    @neopets = Neopet.all
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
    @neopet = Neopet.find(params[:id])
  end

  def update
    @neopet = Neopet.find(params[:id])
    @neopet = Neopet.update(neopet_params(:name))
    redirect_to neopet_path(@neopet)
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
