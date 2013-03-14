class Event < ActiveRecord::Base
  attr_accessible :description, :time, :title, :user

  belongs_to :user
end
