class Article < ActiveRecord::Base
	validates :title, :author, :body, presence: true
	belongs_to :author
	before_save :increment_edit_count
	
	def increment_edit_count
		self.edits += 1 unless self.new_record?
	end
end
