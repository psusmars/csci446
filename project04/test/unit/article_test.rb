require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  fixtures :articles
	
	test "do not allow names 'Pat'" do
		article = Article.new(
								title:       "Blah Title",
                author:      "Patrick Simmons",
								body:        "Blah body")
		assert !article.save
	end
	
	def new_article()
    Article.new(title:       "Blah Title",
                author:      "Blah Author",
								body:        "Blah body")
  end
end
