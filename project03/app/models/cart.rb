class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	
	def add_product(product_id)
		#Active Record knows to make a "Find_by" searching by
		#the column name of "product_id"
		current_item = lineitems.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
end
