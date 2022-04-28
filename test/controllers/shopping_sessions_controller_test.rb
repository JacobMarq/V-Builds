require "test_helper"

class ShoppingSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_session = shopping_sessions(:one)
  end

  test "should get index" do
    get shopping_sessions_url, as: :json
    assert_response :success
  end

  test "should create shopping_session" do
    assert_difference("ShoppingSession.count") do
      post shopping_sessions_url, params: { shopping_session: { total: @shopping_session.total, user_id: @shopping_session.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show shopping_session" do
    get shopping_session_url(@shopping_session), as: :json
    assert_response :success
  end

  test "should update shopping_session" do
    patch shopping_session_url(@shopping_session), params: { shopping_session: { total: @shopping_session.total, user_id: @shopping_session.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy shopping_session" do
    assert_difference("ShoppingSession.count", -1) do
      delete shopping_session_url(@shopping_session), as: :json
    end

    assert_response :no_content
  end
end
