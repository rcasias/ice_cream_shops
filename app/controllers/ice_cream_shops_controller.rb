class IceCreamShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
  end

  def create
    shop = Shop.new({
      name: params[:shop][:name],
      description: params[:shop][:description]
      })
    shop.save
    redirect_to '/ice_cream_shops'
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update({
      name: params[:shop][:name],
      description: params[:shop][:description]
      })
      shop.save
      redirect_to "/ice_cream_shops/#{shop.id}"
  end

  def destroy
    Shop.destroy(params[:id])
    redirect_to '/ice_cream_shops'
  end  
end
