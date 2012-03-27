module UsersHelper

	def is_new_user_and_has_file? user
		!user.new_record? and user.photo.file?
	end
	
	def get_first_and_last_name_string user
		"#{user.first_name} #{user.last_name}"
	end
	
end
