class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, minimum: 6
	validates :password, minimum: 6
	has_secure_password
end
