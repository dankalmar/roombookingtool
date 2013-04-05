class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :start_date, :end_date, :start_time, :end_time
  attr_accessor :start_date, :end_date, :start_time, :end_time
  belongs_to :user

  before_validation :set_dates

  validate :time_is_available?
  validate :time_is_in_the_past?


  def set_dates
  	self.start_at = Time.zone.parse start_date + start_time
  	self.end_at = Time.zone.parse end_date + end_time

  end

  def time_is_available?
  	if Event.where("start_at < ? AND end_at > ?", start_at, start_at).any?
		errors.add(:start_at, "Time already taken, try again bro")
  	end
  end

  def time_is_in_the_past?
  	if start_at && start_at < Date.today
  		errors.add(:start_at, "Can't be in the past")
  	end
  end

end
