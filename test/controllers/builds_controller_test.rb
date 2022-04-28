require "test_helper"

class BuildsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @build = builds(:one)
  end

  test "should get index" do
    get builds_url, as: :json
    assert_response :success
  end

  test "should create build" do
    assert_difference("Build.count") do
      post builds_url, params: { build: { discount_id: @build.discount_id, price: @build.price } }, as: :json
    end

    assert_response :created
  end

  test "should show build" do
    get build_url(@build), as: :json
    assert_response :success
  end

  test "should update build" do
    patch build_url(@build), params: { build: { discount_id: @build.discount_id, price: @build.price } }, as: :json
    assert_response :success
  end

  test "should destroy build" do
    assert_difference("Build.count", -1) do
      delete build_url(@build), as: :json
    end

    assert_response :no_content
  end
end
