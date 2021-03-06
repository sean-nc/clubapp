class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  after_action :venue_authorization, only: [:new, :edit, :create, :update, :destroy]
  skip_before_action :user_authorized?, only: [:index, :show]

  def index
    @venues = Venue.all
  end

  def show
    @events = @venue.events.last(3)
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue, notice: 'Venue was successfully created.'
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :location, :age, :email, :phone, :capacity,
                                    :music, :dress_code, :website, :category)
    end
end
