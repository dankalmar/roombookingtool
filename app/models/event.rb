class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :start_date, :end_date, :start_time, :end_time
  attr_accessor :start_date, :end_date, :start_time, :end_time
  belongs_to :user

  before_save :set_dates

  def set_dates
  	self.start_at = Time.zone.parse start_date + start_time
  	self.end_at = Time.zone.parse end_date + end_time

  end

end
