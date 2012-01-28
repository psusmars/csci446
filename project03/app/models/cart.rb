class Cart < ActiveRecord::Base
	has_man :line_items, dependent: :destroy
end
