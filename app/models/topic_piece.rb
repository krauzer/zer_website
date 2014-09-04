class TopicPiece < ActiveRecord::Base 
	belongs_to :topic 
	belongs_to :piece
	
end 