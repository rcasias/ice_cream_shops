class IceCreamShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
  end

  def create
    shop = Shop.new({
      name: params[:shop][:name],
      address: params[:shop][:address],
      phone_number: params[:shop][:phone_number],
      hours_of_operation: params[:shop][:hours_of_operation],
      has_delivery: params[:shop][:has_delivery],
      rating: params[:shop][:rating],
      created_at: params[:shop][:created_at],
      updated_at: params[:shop][:updated_at]
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
      address: params[:shop][:address],
      phone_number: params[:shop][:phone_number],
      hours_of_operation: params[:shop][:hours_of_operation],
      has_delivery: params[:shop][:has_delivery],
      rating: params[:shop][:rating],
      created_at: params[:shop][:created_at],
      updated_at: params[:shop][:updated_at]
      })
      shop.save
      redirect_to "/ice_cream_shops/#{shop.id}"
  end

  def destroy
    Shop.destroy(params[:id])
    redirect_to '/ice_cream_shops'
  end
end
