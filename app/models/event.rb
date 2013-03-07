class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :user
end
