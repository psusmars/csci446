class Article < ActiveRecord::Base
	validates :title, :author, :body, presence: true
	validate :name_cant_contain_pat
	
	def name_cant_contain_pat
		if !author.blank? and /\b[P|p][A|a][T|t]/.match(author) != nil
			errors.add(:author, "can't contain the name/word \"Pat\"")
		end
	end
end
