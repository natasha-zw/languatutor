require "test_helper"

class CourseOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get course_orders_create_url
    assert_response :success
  end

  test "should get update" do
    get course_orders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get course_orders_destroy_url
    assert_response :success
  end
end
