class Thought < ActiveRecord::Base
  before_create :record_day

  def self.from_today
    today = Time.now.to_date
    self.where(day: today)
  end

  def day_name 
    Date::DAYNAMES[day.wday]
  end

  private 
  def record_day
    self.day = Time.now.to_date
  end
end 