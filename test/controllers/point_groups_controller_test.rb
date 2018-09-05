require 'test_helper'

class PointGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get point_groups_show_url
    assert_response :success
  end

end
