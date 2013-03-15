class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title

  belongs_to :user
end
