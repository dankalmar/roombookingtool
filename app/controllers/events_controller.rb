class EventsController < ApplicationController
	def index
		if params[:day]
			@date = params[:day].to_date
		else
			@date = Date.today
		end

		@events = Event.where(created_at: @date.beginning_of_day..@date.end_of_day)


		@events_month = Event.where(created_at: @date.beginning_of_month..@date.end_of_month).map do |d|
			d.created_at.to_date
		end
	end

	def new
		@event = Event.new
	end

	def create
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