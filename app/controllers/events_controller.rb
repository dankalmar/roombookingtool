class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		Rails.logger.debug 'PARAMS!!!!!!!!!!!!!!!!'
		Rails.logger.debug params[:event]
		@event = Event.new params[:event]

		if @event.save
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