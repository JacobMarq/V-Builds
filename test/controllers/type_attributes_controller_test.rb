require "test_helper"

class TypeAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_attribute = type_attributes(:one)
  end

  test "should get index" do
    get type_attributes_url, as: :json
    assert_response :success
  end

  test "should create type_attribute" do
    assert_difference("TypeAttribute.count") do
      post type_attributes_url, params: { type_attribute: { attribute_id: @type_attribute.attribute_id, type_id: @type_attribute.type_id } }, as: :json
    end

    assert_response :created
  end

  test "should show type_attribute" do
    get type_attribute_url(@type_attribute), as: :json
    assert_response :success
  end

  test "should update type_attribute" do
    patch type_attribute_url(@type_attribute), params: { type_attribute: { attribute_id: @type_attribute.attribute_id, type_id: @type_attribute.type_id } }, as: :json
    assert_response :success
  end

  test "should destroy type_attribute" do
    assert_difference("TypeAttribute.count", -1) do
      delete type_attribute_url(@type_attribute), as: :json
    end

    assert_response :no_content
  end
end
