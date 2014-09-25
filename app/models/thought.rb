class Thought < ActiveRecord::Base
  before_create :record_day

  def self.from_today
    today = Time.now.to_date
    self.where(day: today)
  end

  def self.last_week
    week = {}
    Date::DAYNAMES.each do |day|
      if Date::DAYNAMES[Time.now.to_date.wday]
        week[day] = 1
      else
        week[day] = nil
      end
    end
    seven_days = []
    6.times{|x| seven_days << Time.now.to_date.prev_day(x+1)}
    seven_days.each do |date|
    	day_name = Date::DAYNAMES[date.wday]
    	week[day_name] = self.where(day: date)
    end
    week
  end

  def day_name 
    Date::DAYNAMES[day.wday]
  end

  private 
  def record_day
    self.day = Time.now.to_date
  end
end 