class EventsController < ApplicationController
	
	before_filter :authenticate_user!, except: [:index]

	def index
		if params[:day]
			@date = params[:day].to_date
		else
			@date = Date.today
		end

		@events = Event.where(start_at: @date.beginning_of_day..@date.end_of_day)


		@events_month = Event.where(start_at: @date.beginning_of_month..@date.end_of_month).map do |d|
			d.start_at.to_date
		end

		@users = User.all

	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new params[:event]
		@event.user_id = current_user.id


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