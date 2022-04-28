require "test_helper"

class UserBuildsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_build = user_builds(:one)
  end

  test "should get index" do
    get user_builds_url, as: :json
    assert_response :success
  end

  test "should create user_build" do
    assert_difference("UserBuild.count") do
      post user_builds_url, params: { user_build: { build_id: @user_build.build_id, user_id: @user_build.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_build" do
    get user_build_url(@user_build), as: :json
    assert_response :success
  end

  test "should update user_build" do
    patch user_build_url(@user_build), params: { user_build: { build_id: @user_build.build_id, user_id: @user_build.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_build" do
    assert_difference("UserBuild.count", -1) do
      delete user_build_url(@user_build), as: :json
    end

    assert_response :no_content
  end
end
