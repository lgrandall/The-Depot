class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def remove
  	if self.quantity > 1
  		self.update(quantity: self.quantity - 1)
  		cart.update(total: cart.total - self.price)
  	elsif self.quantity == 1
  		cart.update(total: cart.total - self.price)
  		destroy
  	end
  end
end
