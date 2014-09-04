class Context < ActiveRecord::Base
has_many :topicable_topics, as: :topicable
has_many :topics, through: :topicable_topics

end 