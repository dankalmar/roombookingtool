class EventsController < ApplicationController
	
	before_filter :authenticate_user!, except: [:index]

	def index
		@date = params[:day] ? params[:day].to_date : Date.today
		@events = Event.where('DATE(start_at) <= ? AND DATE(end_at) >= ?', @date, @date)
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