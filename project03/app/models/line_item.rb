class LineItem < ActiveRecord::Base
	#links the line item to the product and cart tables
	belongs_to :product
	belongs_to :cart
end
