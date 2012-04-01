class Admin::AdminController < ApplicationController
	before_filter :require_user
	
	filter_access_to :all
	
	def index
		@games_count = Game.count
		@games = Game.paginate page: params[:page], order: 'created_at desc',	per_page: 10
	end
	
	protected
		def permission_denied
			flash[:error] = "You do not have access to #{request.path}."
			respond_to do |format|
				if current_user.admin?
					format.html {redirect_to admin_root_url}
				else
					format.html {redirect_to members_root_url}
				end
			end
		end

end