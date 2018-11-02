require 'test_helper'

class TicketOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_option = ticket_options(:one)
  end

  test "should get index" do
    get ticket_options_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_option_url
    assert_response :success
  end

  test "should create ticket_option" do
    assert_difference('TicketOption.count') do
      post ticket_options_url, params: { ticket_option: {  } }
    end

    assert_redirected_to ticket_option_url(TicketOption.last)
  end

  test "should show ticket_option" do
    get ticket_option_url(@ticket_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_option_url(@ticket_option)
    assert_response :success
  end

  test "should update ticket_option" do
    patch ticket_option_url(@ticket_option), params: { ticket_option: {  } }
    assert_redirected_to ticket_option_url(@ticket_option)
  end

  test "should destroy ticket_option" do
    assert_difference('TicketOption.count', -1) do
      delete ticket_option_url(@ticket_option)
    end

    assert_redirected_to ticket_options_url
  end
end
