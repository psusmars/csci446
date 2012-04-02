class Game < ActiveRecord::Base
	belongs_to :user, :counter_cache => true
	validates :title, presence: true
	RATINGS = %w[Amazing Good Meh. Horrible]
	def rating_symbols
    [RATINGS.to_sym]
  end
end
