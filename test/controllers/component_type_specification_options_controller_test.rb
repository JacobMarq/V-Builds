require "test_helper"

class ComponentTypeSpecificationOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_type_specification_option = component_type_specification_options(:one)
  end

  test "should get index" do
    get component_type_specification_options_url, as: :json
    assert_response :success
  end

  test "should create component_type_specification_option" do
    assert_difference("ComponentTypeSpecificationOption.count") do
      post component_type_specification_options_url, params: { component_type_specification_option: { specification_id: @component_type_specification_option.specification_id, component_id: @component_type_specification_option.component_id, option_id: @component_type_specification_option.option_id, type_id: @component_type_specification_option.type_id } }, as: :json
    end

    assert_response :created
  end

  test "should show component_type_specification_option" do
    get component_type_specification_option_url(@component_type_specification_option), as: :json
    assert_response :success
  end

  test "should update component_type_specification_option" do
    patch component_type_specification_option_url(@component_type_specification_option), params: { component_type_specification_option: { specification_id: @component_type_specification_option.specification_id, component_id: @component_type_specification_option.component_id, option_id: @component_type_specification_option.option_id, type_id: @component_type_specification_option.type_id } }, as: :json
    assert_response :success
  end

  test "should destroy component_type_specification_option" do
    assert_difference("ComponentTypeSpecificationOption.count", -1) do
      delete component_type_specification_option_url(@component_type_specification_option), as: :json
    end

    assert_response :no_content
  end
end
