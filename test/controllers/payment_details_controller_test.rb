require "test_helper"

class PaymentDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_detail = payment_details(:one)
  end

  test "should get index" do
    get payment_details_url, as: :json
    assert_response :success
  end

  test "should create payment_detail" do
    assert_difference("PaymentDetail.count") do
      post payment_details_url, params: { payment_detail: { amount: @payment_detail.amount, provider: @payment_detail.provider, status: @payment_detail.status } }, as: :json
    end

    assert_response :created
  end

  test "should show payment_detail" do
    get payment_detail_url(@payment_detail), as: :json
    assert_response :success
  end

  test "should update payment_detail" do
    patch payment_detail_url(@payment_detail), params: { payment_detail: { amount: @payment_detail.amount, provider: @payment_detail.provider, status: @payment_detail.status } }, as: :json
    assert_response :success
  end

  test "should destroy payment_detail" do
    assert_difference("PaymentDetail.count", -1) do
      delete payment_detail_url(@payment_detail), as: :json
    end

    assert_response :no_content
  end
end
