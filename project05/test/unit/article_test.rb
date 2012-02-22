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
	
	test "increase number of edits" do
		article = new_article()
		edits = article.edits
		edits += 1
		put(:update, {id: article, article: article.attributes})
		assert_equal edits, Article.find(article.id).edits
	end
	
	def new_article()
    Article.new(title:       "Blah Title",
                author:      "Blah Author",
								body:        "Blah body")
  end
end
