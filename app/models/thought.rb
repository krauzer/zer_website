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

  def self.find_day(day)
    today = Time.now.to_date.wday
    date_index = nil
    Date::DAYNAMES.each_with_index do |day_name, index|
      date_index = index if day == day_name.downcase 
    end
    if today >= date_index
      day_wanted = Time.now.to_date.prev_day(today - date_index)
    else
      day_wanted = Time.now.to_date.prev_day((today - date_index)+ 7)
    end
    self.where(day: day_wanted)
  end

  def day_name 
    Date::DAYNAMES[day.wday]
  end

  private 
  def record_day
    self.day = Time.now.to_date
  end
end 