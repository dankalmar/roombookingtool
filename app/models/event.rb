class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :start_date, :end_date

  belongs_to :user
end
