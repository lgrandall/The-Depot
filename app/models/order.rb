class Order < ApplicationRecord
	has_many :line_items

	enum pay_type: {
		"check" => 0,
		"Credit Card" => 1,
		"Purchase Order" => 3
	}
end
