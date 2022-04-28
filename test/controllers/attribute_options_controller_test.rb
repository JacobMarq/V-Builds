require "test_helper"

class AttributeOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attribute_option = attribute_options(:one)
  end

  test "should get index" do
    get attribute_options_url, as: :json
    assert_response :success
  end

  test "should create attribute_option" do
    assert_difference("AttributeOption.count") do
      post attribute_options_url, params: { attribute_option: { attribute_id: @attribute_option.attribute_id, option_id: @attribute_option.option_id } }, as: :json
    end

    assert_response :created
  end

  test "should show attribute_option" do
    get attribute_option_url(@attribute_option), as: :json
    assert_response :success
  end

  test "should update attribute_option" do
    patch attribute_option_url(@attribute_option), params: { attribute_option: { attribute_id: @attribute_option.attribute_id, option_id: @attribute_option.option_id } }, as: :json
    assert_response :success
  end

  test "should destroy attribute_option" do
    assert_difference("AttributeOption.count", -1) do
      delete attribute_option_url(@attribute_option), as: :json
    end

    assert_response :no_content
  end
end
