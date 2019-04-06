class StoreController < ApplicationController
	include StoreIndexCounter
	
  def index
  	@products = Product.order(:title)
  	count_increment
  end
end
