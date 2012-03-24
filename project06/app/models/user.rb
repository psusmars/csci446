class User < ActiveRecord::Base
	belongs_to :role
	#has_one :profile
	acts_as_authentic do |c|
		c.validates_uniqueness_of_email_field_options = {:if => "false"}
		c.validates_length_of_password_field_options = {:if => "true", :minimum => 6}
		c.validates_confirmation_of_password_field_options = {:if => "true"}
		c.validates_length_of_password_confirmation_field_options = {:if => "false", :minimum => 4 }
		c.validates_length_of_login_field_options = {:if => "true", :minimum => 6}
	end
	
  def role_symbols
    [role.to_sym]
  end
	
	
	
end
