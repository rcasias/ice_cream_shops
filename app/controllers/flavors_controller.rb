class FlavorsController < ApplicationController
  def index
    @flavors = Flavor.all
  end

  def new
  end

  def create
    flavor = Flavor.new({
      flavor_name: params[:flavor][:flavor_name],
      dairy_free: params[:flavor][:dairy_free],
      nut_free: params[:flavor][:nut_free],
      calories_per_scoop: params[:flavor][:calories_per_scoop],
      price_per_scoop: params[:flavor][:price_per_scoop],
      shop_id: params[:flavor][:shop_id],
      created_at: params[:flavor][:created_at],
      updated_at: params[:flavor][:updated_at]
      })
    flavor.save
    redirect_to '/flavors'
  end

  def show
    @flavor = Flavor.find(params[:id])
  end

  def edit
    @flavor = Flavor.find(params[:id])
  end

  def update
    flavor = Flavor.find(params[:id])
    flavor.update({
      flavor_name: params[:flavor][:flavor_name],
      dairy_free: params[:flavor][:dairy_free],
      nut_free: params[:flavor][:nut_free],
      calories_per_scoop: params[:flavor][:calories_per_scoop],
      price_per_scoop: params[:flavor][:price_per_scoop],
      shop_id: params[:flavor][:shop_id],
      updated_at: params[:flavor][:updated_at]
      })
      flavor.save
      redirect_to "/flavors/#{flavor.id}"
  end

  def destroy
    Flavor.destroy(params[:id])
    redirect_to '/flavors'
  end
end
