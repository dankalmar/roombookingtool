class EventsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index]

  def index
    @time = params[:day] ? Time.zone.parse(params[:day]) : Time.zone.now
    @events = Event.where('start_at <= ? AND end_at >= ?', @time.end_of_day, @time.beginning_of_day)
    monthly_events = Event.where('start_at >= ? AND end_at <= ?', @time.beginning_of_month.beginning_of_week, @time.end_of_month.end_of_week)

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
      render :business
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

