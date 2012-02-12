class Article < ActiveRecord::Base
	validates :title, :author, :body, presence: true
end
