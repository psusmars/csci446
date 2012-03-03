class Author < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :articles, dependent: :destroy
	
	has_attached_file :photo, :styles => { :thumb => "100x100>" }
	
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/png', 'image/jpeg']
	
	validate :name_cant_contain_pat
	
	private 
	def name_cant_contain_pat
		if !name.blank? and /[P|p][A|a][T|t]/.match(name) != nil
			errors.add(:name, "can't contain the name/word \"Pat\"")
		end
	end
end
