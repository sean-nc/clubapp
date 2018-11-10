class TicketsController < ApplicationController
  before_action :set_ticket, only: :show
  before_action :set_event, only: :index
  before_action :set_venue
  before_action :venue_authorization

  def index
    @tickets = @event.tickets.all
  end

  def show
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def set_event
      @event = Event.find([:event_id])
    end

    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def ticket_params
      params.require().permit()
    end
end
