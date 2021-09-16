require "test_helper"

class Api::V1::HealthChecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_health_checks_index_url
    assert_response :success
  end
end
