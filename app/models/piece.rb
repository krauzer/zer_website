class Piece < ActiveRecord::Base
  has_many :topic_pieces 
  has_many :topics, through: :topic_pieces

  def body_sample
  	body.slice(/\A.*\./)
  end
end
