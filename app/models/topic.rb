class Topic < ActiveRecord::Base
  has_many :topic_pieces 
  has_many :pieces, through: :topic_pieces
  has_many :topicable_sub_topics, class_name: "TopicableTopic", as: :topicable
  has_many :topicable_topics
  has_many :frames, through: :topicable_topics, source: :topicable, source_type: "Frame"
  has_many :topics, through: :topicable_topics, source: :topicable, source_type: "Topic"
  has_many :sub_topics, through: :topicable_sub_topics, source: :topic
end 