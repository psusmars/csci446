require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	test "do not allow names 'Pat'" do
		author = Author.new(name: "Blah Title")
		assert !author.save
	end
end
