class FlavorsController < ApplicationController
  def index
    @flavors = Flavor.sort_flavors_by_name.sort_out_false_booleans
  end

  def new
  end

  def create
    flavor = Flavor.create(flavor_params)
    redirect_to '/flavors'
  end

  def flavor_params
    params.require(:flavor).permit(:flavor_name, :dairy_free, :nut_free, :calories_per_scoop, :price_per_scoop, :shop_id)
  end

  def show
    @flavor = Flavor.find(params[:id])
  end

  def edit
    @flavor = Flavor.find(params[:id])
  end

  def update
    @flavor = Flavor.find(params[:id])
    @flavor.update(flavor_params)
    redirect_to "/flavors/#{@flavor.id}"
  end

  def destroy
    Flavor.destroy(params[:id])
    redirect_to '/flavors'
  end


end
