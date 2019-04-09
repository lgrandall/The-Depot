class TotalPricesForLineItems < ActiveRecord::Migration[5.0]
  def change
  	LineItem.all.each do |line_item|

  		line_item.update(price: line_item.product.price)
  	end
  end
end
