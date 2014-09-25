class Thought < ActiveRecord::Base
  before_create :record_day
	
  private 
  def record_day
    self.day = Time.now.to_date
  end
end 