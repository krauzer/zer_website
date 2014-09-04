class TopicableTopic < ActiveRecord::Base 
	belongs_to :topics
	belongs_to :topicable, polymorphic: true 
end 