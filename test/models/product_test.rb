require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products

	test "the product attributes cannot be submitted as empty" do 
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
	end

	test "product price must be positive" do 
		product = Product.new(title: "My book title",
													description: "Yay",
													image_url: "yayayay.jpg",
													price: -1)

		assert product.invalid?

		product.price = 0
		assert product.invalid?


		product.price = 1
		assert product.valid?
	end

	def new_product(image_url)
		Product.new(
			title: 'My book',
			description: 'Cool stuff inside',
			price: 100,
			image_url: image_url
			)
	end

	test 'admits only correct image_url' do
		ok = %{fred.gif fred.jpg fred.png FRED.JPG, Fred.Jpg http://a.b.c/x/y/z/fred.gif }
		bad = %w{fred.dox fred.xlsl fred.gifmore fred.gif.more}

		ok.each do |image_url|
			assert new_product(image_url).valid?,
				"#{image_url} should be valid"
		end 

		bad.each do |image_url|
			assert new_product(image_url).invalide?,
				"#{image_url} should be invalid"
		end
	end

end
