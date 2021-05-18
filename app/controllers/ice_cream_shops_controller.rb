class IceCreamShopsController < ApplicationController
  def index
    @shops = Shop.all.order('created_at DESC')
  end

  def new
  end

  def create
    # shop = Shop.new({
    #   name: params[:shop][:name],
    #   address: params[:shop][:address],
    #   phone_number: params[:shop][:phone_number],
    #   hours_of_operation: params[:shop][:hours_of_operation],
    #   has_delivery: params[:shop][:has_delivery],
    #   rating: params[:shop][:rating],
    #   created_at: params[:shop][:created_at],
    #   updated_at: params[:shop][:updated_at]
    #   })
    # shop.save
    # redirect_to '/ice_cream_shops'
    shop = Shop.create(shop_params)
    redirect_to "/ice_cream_shops"
  end

  def shop_params
    params.permit(:name, :address, :phone_number, :hours_of_operation, :has_delivery, :rating, :updated_at, :created_at)
  end

  def show
    @shop = Shop.find(params[:id])
    @flavors = @shop.flavors
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update({
      name: params[:shop][:name],
      address: params[:shop][:address],
      phone_number: params[:shop][:phone_number],
      hours_of_operation: params[:shop][:hours_of_operation],
      has_delivery: params[:shop][:has_delivery],
      rating: params[:shop][:rating]
      })
      # binding.pry
      shop.save
      redirect_to "/ice_cream_shops/#{shop.id}"
  end

  def destroy
    Shop.destroy(params[:id])
    redirect_to '/ice_cream_shops'
  end

  def flavors
    @shop = Shop.find(params[:id])
    flavors_by_name = @shop.flavors
    flavors_by_name = flavors_by_name.order(:flavor_name) if params[:sort_by_name]
    @flavors = flavors_by_name
  end

  def new_flavor
    @shop = Shop.find(params[:id])
  end

end
