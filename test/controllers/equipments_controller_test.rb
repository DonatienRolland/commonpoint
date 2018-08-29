require 'test_helper'

class EquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get equipments_update_url
    assert_response :success
  end

end
