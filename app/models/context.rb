class Context < ActiveRecord::Base
  has_many :topicable_topics, as: :topicable
  has_many :sub_topics, through: :topicable_topics, source: :topic
end 