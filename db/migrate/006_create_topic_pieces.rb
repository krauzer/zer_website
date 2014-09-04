class CreateTopicPieces < ActiveRecord::Migration
  def change 
  	create_table :topic_pieces do |t|
	  	t.references :topic
	  	t.references :piece
  	end
  end
end
