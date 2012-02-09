class Article < ActiveRecord::Base
self.created_on.strftime("%B %d, %Y")

end
