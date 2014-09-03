class Context < ActiveRecord::Base
has_many :topics, as: :topicable

end 