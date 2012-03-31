class Admin::AdminController < ApplicationController
	before_filter :require_user
	
	#filter_access_to :all
	
	def index
		@games_count = Game.count
		@games = Game.paginate page: params[:page], order: 'created_at desc',	per_page: 10
	end
	
	protected
		def permission_denied
			flash[:notice] = "You do not have access to #{request.path}."
			respond_to do |format|
				format.html {redirect_to admin_root_url}
			end
		end

end