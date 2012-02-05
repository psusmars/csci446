class ApplicationController < ActionController::Base
	before_filter :authorize

  protect_from_forgery

  private
	
		def current_cart
			#gets the cart id from the session object
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
			#if the id is nil, then create new cart
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
		
	protected
		
		def authorize
			unless User.find_by_id(session[:user_id])
				redirect_to login_url, notice: "Please log in"
			end
		end
end

