require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get participants_update_url
    assert_response :success
  end

end
