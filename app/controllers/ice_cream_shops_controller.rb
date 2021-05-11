class IceCreamShopsController < ApplicationController
  def index
    @shops = ['Shop 1', 'Shop 2', 'Shop 3']
  end
end
