class Piece < ActiveRecord::Base
  has_many :topic_pieces 
  has_many :topics, through: :topic_pieces
  before_create :record_day

  def body_sample
  	body.slice(/\A.*\./)
  end

  private 
  def record_day 
    self.day = Time.now.to_date
  end
end
