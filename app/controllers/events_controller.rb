class EventsController < ApplicationController
	
	before_filter :authenticate_user!, except: [:index]

	def index
		@date = params[:day] ? params[:day].to_date : Date.today
		@events = Event.where('DATE(start_at) <= ? AND DATE(end_at) >= ?', @date, @date)
		monthly_events = Event.where('DATE(start_at) >= ? AND DATE(end_at) <= ?', @date.beginning_of_month, @date.end_of_month)

		@events_hash = {}
		monthly_events.each do |event|
			day_range = event.start_at.strftime("%d").to_i..event.end_at.strftime("%d").to_i
			day_range.each do |day|
				if @events_hash[day]
					@events_hash[day] += 1
				else
					@events_hash[day] = 1
				end
			end
		end 

	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new params[:event]
		@event.user = current_user


		if @event.save
			MyMailer.event_confirmation(@event.user).deliver
			redirect_to events_path
		else
			render :new
		end
	end

	def edit 
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes params[:event]
			redirect_to events_path
		else
			render :edit
		end
	end
	
end

