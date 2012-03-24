class User < ActiveRecord::Base
	belongs_to: roles
	acts_as_authentic do |c|
		c.validates_uniqueness_of_email_field_options = {:if => "false"}
		c.validates_length_of_password_field_options = {:if => "true", :minimum => 6}
		c.validates_format_of_login_field_options = {:if => "false", :with => Authlogic::Regex.login}
		c.validates_length_of_email_field_options = {:if => "false", :minimum => 4}
		c.validates_confirmation_of_password_field_options = {:if => "true"}
		c.validates_length_of_password_confirmation_field_options = {:if => "false", :minimum => 4 }
		c.validates_length_of_login_field_options = {:if => "true", :minimum => 6}
	end
	ROLES = %w[member admin]
  
  def role_symbols
    [role.to_sym]
  end
	#validates :username, presence: true, uniqueness: true
	#validates_length_of :password, minimum: 6
	#validates_length_of :username, minimum: 6
	#session[:user_id] = User.find().id
	#@user = User.find(session[:user_id])
end
