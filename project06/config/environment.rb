# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['RECAPTCHA_PUBLIC_KEY'] = "6LfwWs8SAAAAAJrvsqO6wJVfnGvvr7adI-42R-tw"
ENV['RECAPTCHA_PRIVATE_KEY'] = "6LfwWs8SAAAAAPU9iNp5-SZHi7LcBM6-ihJ4bdkf"

# Initialize the rails application
Gamez::Application.initialize!
