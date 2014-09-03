class Topic < ActiveRecord::Base
	belongs_to :topicable, polymorphic: true 
	has_many :topics, as: :topicable
	has_many :pieces
	
end 