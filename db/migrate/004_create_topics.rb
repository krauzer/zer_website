class CreateTopics < ActiveRecord::Migration
  def change 
  	create_table :topics do |t|
  		t.string :name
  		t.integer :topicable_id
  		t.string :topicable_type

  		t.timestamps
  	end 
  end 
end
