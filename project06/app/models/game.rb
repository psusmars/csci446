class Game < ActiveRecord::Base
	belongs_to :users
	validates :title, presence: true
	RATINGS = %w[Amazing Good Meh. Horrible]
end
