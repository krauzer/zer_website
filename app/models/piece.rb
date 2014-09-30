class Piece < ActiveRecord::Base
  has_many :topic_pieces
  has_many :topics, through: :topic_pieces
  before_create :record_day

  def body_sample
  	body.slice(/\A.*\./)
  end

  def proper_date
    date = day.to_s
    year = date[2,2]
    dy = date[-2,2]
    month = date[5,2]
    "#{month}/#{dy}"
  end

  private
  def record_day
    self.day = Time.now.to_date
  end
end
