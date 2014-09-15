class TopicableTopic < ActiveRecord::Base 
	belongs_to :topic
	belongs_to :topicable, polymorphic: true 
end 