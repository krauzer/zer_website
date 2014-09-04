class CreateTopicableTopics < ActiveRecord::Migration
  def change 
  	create_table :topicable_topics do |t|
  		t.integer :topicable_id
  		t.string :topicable_type
  		t.references :topic
  	end
  end
end
