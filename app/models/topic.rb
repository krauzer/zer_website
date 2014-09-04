class Topic < ActiveRecord::Base
	has_many :topic_pieces 
	has_many :pieces, through: :topic_pieces
	has_many :topicable_topics, as: :topicable
  has_many :contexts, through: :topicable_topics
  has_many :topics, through: :topicable_topics
end 