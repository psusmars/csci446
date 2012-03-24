class User < ActiveRecord::Base
	acts_as_authentic
	validates :username, presence: true, uniqueness: true
	validates_length_of :password, minimum: 6
	validates_length_of :username, minimum: 6
	#session[:user_id] = User.find().id
	#@user = User.find(session[:user_id])
end
