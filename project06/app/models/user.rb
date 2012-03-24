class User < ActiveRecord::Base
	belongs_to :role
	
	has_attached_file :photo, :styles => { :thumb => "100x100>" }
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/png', 'image/jpeg', 'image/jpg']
	
	before_save :add_role
	
	acts_as_authentic do |c|
		c.validates_uniqueness_of_email_field_options = {:if => "false"}
		c.validates_length_of_password_field_options = {:if => "true", :minimum => 6}
		c.validates_confirmation_of_password_field_options = {:if => "true"}
		c.validates_length_of_password_confirmation_field_options = {:if => "false", :minimum => 4 }
		c.validates_length_of_login_field_options = {:if => "true", :minimum => 6}
	end
	
	def add_role
		if self.new_record? and self.username != "administrator"
			self.role_id = Role.find_by_name("Member").id
		end
	end
	
  def role_symbols
    [role.to_sym]
  end
end
