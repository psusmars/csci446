module ApplicationHelper
	def user_nav
		if current_user
			if current_user.admin?
				render "admin/admin_nav"
			else
				render "members/member_nav"
			end
		else
			render "/login_nav"
		end
	end
end
