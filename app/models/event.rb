class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :start_date, :end_date, :start_time, :end_time

  belongs_to :user
end
