class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :twitter_handle, :website

  has_many :events
end
