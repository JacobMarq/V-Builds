require "test_helper"

class SpecificationOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specification_option = specification_options(:one)
  end

  test "should get index" do
    get specification_options_url, as: :json
    assert_response :success
  end

  test "should create specification_option" do
    assert_difference("SpecificationOption.count") do
      post specification_options_url, params: { specification_option: { specification_id: @specification_option.specification_id, option_id: @specification_option.option_id } }, as: :json
    end

    assert_response :created
  end

  test "should show specification_option" do
    get specification_option_url(@specification_option), as: :json
    assert_response :success
  end

  test "should update specification_option" do
    patch specification_option_url(@specification_option), params: { specification_option: { specification_id: @specification_option.specification_id, option_id: @specification_option.option_id } }, as: :json
    assert_response :success
  end

  test "should destroy specification_option" do
    assert_difference("SpecificationOption.count", -1) do
      delete specification_option_url(@specification_option), as: :json
    end

    assert_response :no_content
  end
end
