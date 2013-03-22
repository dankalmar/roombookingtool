class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :start_date, :end_date, :start_time, :end_time

  belongs_to :user

  def start_date
  end

  def start_time
  end

  def end_date
  end

  def end_time
  end
end
