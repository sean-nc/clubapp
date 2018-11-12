require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @venue = venues(:one)
    @user = User.create(email: "email@email.com", password: "password",
                        password_confirmation: "password", username: "sean",
                        first_name: "Sean", last_name: "Cordes", gender: "Male",
                        date_of_birth: Date.new(1990, 2, 11))
  end


  # Any user can access
  ###############################
  test "should get index" do
    get venues_url
    assert_response :success
  end

  test "should get show" do
    get venue_url(@venue)
    assert_response :success
  end



  # Admin of site can access
  ###############################
  test "should get new" do
    sign_in @user
    @user.add_role(:admin)

    get new_venue_url
    assert_response :success
  end

  test "should create venue" do
    sign_in @user
    @user.add_role(:admin)

    assert_difference('Venue.count') do
      post venues_url,
        params: { venue:
                  { name: "name", location: "Toronto", age: 19, email: "business1@email.com",
                    phone: "4165791911", capacity: 300, music: "music", dress_code: "dress code",
                    website: "https://biz1.com", category: "category" } }
    end

    assert_redirected_to venue_url(Venue.last)
  end

  test "should destroy venue" do
    sign_in @user
    @user.add_role(:admin)

    assert_difference('Venue.count', -1) do
      delete venue_url(@venue)
    end

    assert_redirected_to venues_url
  end

  # Admin of venue can access
  ###############################

  test "should get edit" do
    sign_in @user
    @user.add_role(:admin, @venue)

    get edit_venue_url(@venue)
    assert_response :success
  end

  test "should update venue" do
    sign_in @user
    @user.add_role(:admin, @venue)

    patch venue_url(@venue),
      params: { venue:
                { name: "name", location: "Toronto", age: 19, email: "business1@email.com",
                  phone: "4165791911", capacity: 300, music: "music", dress_code: "dress code",
                  website: "https://biz1.com", category: "category" } }

    assert_redirected_to venue_url(@venue)
  end
end
