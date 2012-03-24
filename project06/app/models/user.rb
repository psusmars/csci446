class User < ActiveRecord::Base
	validates :username, presence: true, uniqueness: true
	validates_length_of :password, minimum: 6
	validates_length_of :username, minimum: 6
	has_secure_password
	#session[:user_id] = User.find().id
	#@user = User.find(session[:user_id])
end
