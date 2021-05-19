class IceCreamShopsController < ApplicationController
  def index
    @shops = Shop.order_shop_by_desc_date
  end

  def new
  end

  def create
    binding.pry
    shop = Shop.create(shop_params)
    redirect_to "/ice_cream_shops"
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number, :hours_of_operation, :has_delivery, :rating)
  end

  def show
    @shop = Shop.find(params[:id])
    @flavors = @shop.flavors
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to "/ice_cream_shops/#{@shop.id}"
  end

  def destroy
    Shop.destroy(params[:id])
    redirect_to '/ice_cream_shops'
  end

  def flavors
    @shop = Shop.find(params[:id])
    flavors_by_name = @shop.flavors
    flavors_by_name = flavors_by_name.sort_flavors_by_name if params[:sort_by_name]
    @flavors = flavors_by_name
  end

  def new_flavor
    @shop = Shop.find(params[:id])
  end

end
