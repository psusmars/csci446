class Members::MembersController < ApplicationController
	before_filter :require_user
	
	filter_access_to :all
	
	def index
		@games = Game.where(:user_id => current_user.id).paginate(page: params[:page]).order('created_at desc').per_page(10)
	end
	
	protected
		def permission_denied
			flash[:error] = "You do not have access to #{request.path}."
			respond_to do |format|
				format.html {redirect_to members_root_url}
			end
		end

end