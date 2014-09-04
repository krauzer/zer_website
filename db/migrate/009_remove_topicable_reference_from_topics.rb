class RemoveTopicableReferenceFromTopics < ActiveRecord::Migration
    def change 
  	remove_column :topics, :topicable_id
  	remove_column :topics, :topicable_type
  end
end
