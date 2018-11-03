class TicketOptionsController < ApplicationController
  before_action :set_ticket_option, only: [:edit, :update, :destroy]
  before_action :set_event, only: []

  def index
    @ticket_options = TicketOption.all
  end

  def new
    @ticket_option = TicketOption.new
  end

  def edit
  end

  def create
    @ticket_option = TicketOption.new(ticket_option_params)
    if @ticket_option.save
      redirect_to @ticket_option, notice: 'Ticket option was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ticket_option.update(ticket_option_params)
      redirect_to @ticket_option, notice: 'Ticket option was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket_option.destroy
    redirect_to ticket_options_url, notice: 'Ticket option was successfully destroyed.'
    end
  end

  private
    def set_ticket_option
      @ticket_option = TicketOption.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def ticket_option_params
      params.require(:ticket_option).permit(:price, :expiration, :limit)
    end
end
