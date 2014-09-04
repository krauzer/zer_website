class RemoveTopicReferenceFromPiece < ActiveRecord::Migration
  def change 
  	remove_column :pieces, :topic_id
  end
end
