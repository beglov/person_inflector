require 'test_helper'

class PeopleFlowTest < ActionDispatch::IntegrationTest
  test "can see the root page" do
    get "/"
    assert_select "h1", "Список Персон"
  end

  test "can create an person" do
    get "/people/new"
    assert_response :success

    post "/people",
         params: { person: { first_name: "first_name1", last_name: "last_name1", middle_name: 'middle_name1' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", 'Person was successfully created.'
  end
end
