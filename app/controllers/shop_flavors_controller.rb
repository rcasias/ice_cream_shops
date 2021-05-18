class ShopFlavorsController < ApplicationController
  def index
    shop = Shop.find(params[:id])
    @flavors = shop.flavors
  end

  def sort_by_flavor
    @shop = Shop.find(params[:id])
    @students = @school.students.order(:name)
 end
end
