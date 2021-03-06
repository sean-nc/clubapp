class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_venue, exclude: :show
  after_action :venue_authorization, except: [:index, :show]
  skip_before_action :user_authorized?, only: [:index, :show]


  def index
    @events = @venue.events
  end

  def show
    @ticket_options = @event.ticket_options.all
  end

  def new
    @event = @venue.events.build
  end

  def edit
  end

  def create
    @event = @venue.events.build(event_params)
    if @event.save
      redirect_to venue_event_path(@venue, @event), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to venue_event_path(@venue, @event), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to venue_events_path(@venue), notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def event_params
      params.require(:event).permit(:start_time, :end_time, :name, :description, :venue_id)
    end
end
