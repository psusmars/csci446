module UsersHelper

	def is_new_user_and_has_file? user
		!user.new_record? and user.photo.file?
	end
	
	def get_first_and_last_name_string user
		"#{user.first_name} #{user.last_name}"
	end
	
	def get_last_login_as_string user
		if user.last_login_at.nil?
			distance_of_time_in_words_to_now(user.created_at) + " ago"
		else
			distance_of_time_in_words_to_now(user.last_login_at) + " ago"
		end
	end
	
	def render_game_totals_for_user user
		count = current_user.games.size
		rated = current_user.games.count(:conditions => "rating IS NOT NULL")
		"I've created #{pluralize(current_user.games.size, "game")}, #{number_to_percentage(100.0*rated/count, :precision => 0)} of which are rated."
	end
end
