require "test_helper"

class ComponentSpecificationOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_specification_option = component_specification_options(:one)
  end

  test "should get index" do
    get component_specification_options_url, as: :json
    assert_response :success
  end

  test "should create component_specification_option" do
    assert_difference("ComponentSpecificationOption.count") do
      post component_specification_options_url, params: { component_specification_option: { component_id: @component_specification_option.component_id, option_id: @component_specification_option.option_id, specification_id: @component_specification_option.specification_id } }, as: :json
    end

    assert_response :created
  end

  test "should show component_specification_option" do
    get component_specification_option_url(@component_specification_option), as: :json
    assert_response :success
  end

  test "should update component_specification_option" do
    patch component_specification_option_url(@component_specification_option), params: { component_specification_option: { component_id: @component_specification_option.component_id, option_id: @component_specification_option.option_id, specification_id: @component_specification_option.specification_id } }, as: :json
    assert_response :success
  end

  test "should destroy component_specification_option" do
    assert_difference("ComponentSpecificationOption.count", -1) do
      delete component_specification_option_url(@component_specification_option), as: :json
    end

    assert_response :no_content
  end
end
