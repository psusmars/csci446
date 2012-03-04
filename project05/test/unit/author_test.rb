require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	test "do not allow names 'Pat'" do
		author = Author.new(name: "Patty Poo")
		assert !author.save
	end
end
