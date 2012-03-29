class Admin::AdminController < ApplicationController
	before_filter :require_user
	
	#filter_access_to :all
	
	def index
	
	end
	
	protected
		def permission_denied
			flash[:error] = "You do not have access to #{request.path}."
			respond_to do |format|
				format.html {redirect_to admin_root_url}
			end
		end

end