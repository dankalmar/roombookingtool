class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :start_date, :end_date, :start_time, :end_time
  attr_accessor :start_date, :end_date, :start_time, :end_time
  belongs_to :user



  before_validation :set_dates

  validate :time_is_available?
  validate :time_is_in_the_past?
  validate :ends_after_it_starts?
  validates :description, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_date, presence: true
  validates :end_time, presence: true

  def set_dates
    if start_date.present? && start_time.present? && end_date.present? && end_time.present?
    	self.start_at = Time.strptime(start_date + ' ' + start_time, '%m/%d/%Y %l:%M%p')

    	self.end_at = Time.strptime(end_date + ' ' + end_time, '%m/%d/%Y %l:%M%p')
    end    
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

  def ends_after_it_starts?
    if start_at && start_at > end_at
      errors.add(:start_at, "Your event must end after it starts, okay?")
    end
  end

end
