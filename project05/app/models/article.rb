class Article < ActiveRecord::Base
	validates :title, :author, :body, presence: true
	validate :name_cant_contain_pat
	
	before_save :increment_edit_count
	
	private 
	def name_cant_contain_pat
		if !author.blank? and /\b[P|p][A|a][T|t]/.match(author) != nil
			errors.add(:author, "can't contain the name/word \"Pat\"")
		end
	end
	
	def increment_edit_count
		self.edits += 1 unless self.new_record?
	end
end
