require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @venue = venues(:one)

    @event = Event.create(name: "event1", description: "description",
                          start_time: DateTime.now + 24.hours,
                          end_time: DateTime.now + 30.hours,
                          venue_id: @venue.id)

    @user = User.create(email: "email@email.com", password: "password",
                        password_confirmation: "password", username: "sean",
                        first_name: "Sean", last_name: "Cordes", gender: "Male",
                        date_of_birth: Date.new(1990, 2, 11))
  end


  # Any user can access
  ###############################
  test "should get index" do
    get venue_events_url(@venue)
    assert_response :success
  end

  test "should get show" do
    get venue_event_url(@venue, @event)
    assert_response :success
  end

  # Admin of venue can access
  ###############################
  test "should get new" do
    get new_venue_event_url(@venue)
    assert_response :redirect

    sign_in @user
    @user.add_role(:admin, @venue)
    get new_venue_event_url(@venue)
    assert_response :success
  end

  test "should create event" do
    sign_in @user
    @user.add_role(:admin, @venue)

    assert_difference('Event.count') do
      post venue_events_url(@venue),
        params:
          { event:
            { name: "event2", description: "description",
              start_time: DateTime.now + 24.hours, end_time: DateTime.now + 30.hours,
              venue_id: @venue.id } }
    end

    assert_redirected_to venue_event_url(@venue, Event.last)
  end

  test "should get edit" do
    get edit_venue_event_url(@venue, @event)
    assert_response :redirect

    sign_in @user
    @user.add_role(:admin, @venue)

    get edit_venue_event_url(@venue, @event)
    assert_response :success
  end

  test "should update event" do
    sign_in @user
    @user.add_role(:admin, @venue)

    patch venue_event_url(@venue, @event),
      params:
        { event:
          { name: "event2", description: "description",
            start_time: DateTime.now + 24.hours, end_time: DateTime.now + 30.hours,
            venue_id: @venue.id } }

    assert_redirected_to venue_event_url(@venue, @event)
  end

  test "should destroy event" do
    sign_in @user
    @user.add_role(:admin, @venue)

    assert_difference('Event.count', -1) do
      delete venue_event_url(@venue, @event)
    end

    assert_redirected_to venue_events_url(@venue)
  end
end
