class Author < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :articles, dependent: :destroy
	
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
		validate :name_cant_contain_pat
	private 
	def name_cant_contain_pat
		if !author.blank? and /[P|p][A|a][T|t]/.match(author) != nil
			errors.add(:author, "can't contain the name/word \"Pat\"")
		end
	end
end
