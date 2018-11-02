require "application_system_test_case"

class TicketOptionsTest < ApplicationSystemTestCase
  setup do
    @ticket_option = ticket_options(:one)
  end

  test "visiting the index" do
    visit ticket_options_url
    assert_selector "h1", text: "Ticket Options"
  end

  test "creating a Ticket option" do
    visit ticket_options_url
    click_on "New Ticket Option"

    click_on "Create Ticket option"

    assert_text "Ticket option was successfully created"
    click_on "Back"
  end

  test "updating a Ticket option" do
    visit ticket_options_url
    click_on "Edit", match: :first

    click_on "Update Ticket option"

    assert_text "Ticket option was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket option" do
    visit ticket_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket option was successfully destroyed"
  end
end
