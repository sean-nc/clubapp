# require 'test_helper'

# class TicketOptionsControllerTest < ActionDispatch::IntegrationTest
#   include Devise::Test::IntegrationHelpers

#   setup do
#     @venue = venues(:one)

#     @event = Event.create(name: "event1", description: "description",
#                           start_time: DateTime.now + 24.hours,
#                           end_time: DateTime.now + 30.hours,
#                           venue_id: @venue.id)

#     @user = User.create(email: "new_email@email.com", password: "password",
#                         password_confirmation: "password", username: "sean12",
#                         first_name: "Sean", last_name: "Cordes", gender: "Male",
#                         date_of_birth: Date.new(1990, 2, 11))

#     @ticket_option = TicketOption.create(name: "Cover", price: 1000, expiration: @event.end_time,
#                                          limit: 20, description: "description.", event_id: @event.id)
#   end


#   # Any user can access
#   ###############################
#   test "should get index" do
#     get venue_event_ticket_options_url(@venue, @event)
#     assert_response :redirect

#     sign_in @user
#     get venue_event_ticket_options_url(@venue, @event)
#     assert_response :success
#   end

#   test "should get show" do
#     get venue_event_ticket_option_url(@venue, @event, @ticket_option)
#     assert_response :redirect

#     sign_in @user
#     @user.add_role(:admin, @venue)
#     get venue_event_ticket_option_url(@venue, @event, @ticket_option)
#     assert_response :success
#   end

#   test "should get new" do
#     get new_venue_event_ticket_option_url(@venue, @event)
#     assert_response :redirect

#     sign_in @user
#     @user.add_role(:admin, @venue)
#     get new_venue_event_ticket_option_url(@venue, @event)
#     assert_response :success
#   end
# end
