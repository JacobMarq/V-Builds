require "test_helper"

class SpecificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification = specifications(:one)
  end

  test "should get index" do
    get specifications_url, as: :json
    assert_response :success
  end

  test "should create specification" do
    assert_difference("Specification.count") do
      post specifications_url, params: { specification: { specification_name: @specification.specification_name } }, as: :json
    end

    assert_response :created
  end

  test "should show specification" do
    get specification_url(@specification), as: :json
    assert_response :success
  end

  test "should update specification" do
    patch specification_url(@specification), params: { specification: { specification_name: @specification.specification_name } }, as: :json
    assert_response :success
  end

  test "should destroy specification" do
    assert_difference("Specification.count", -1) do
      delete specification_url(@specification), as: :json
    end

    assert_response :no_content
  end
end
