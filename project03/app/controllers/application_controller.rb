#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
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

