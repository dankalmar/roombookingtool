class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user_time_zone
  def set_user_time_zone
    if user_signed_in? and current_user.time_zone
      Time.zone = current_user.time_zone
    end
  end

end


