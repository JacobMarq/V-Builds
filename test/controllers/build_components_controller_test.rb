require "test_helper"

class BuildComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @build_component = build_components(:one)
  end

  test "should get index" do
    get build_components_url, as: :json
    assert_response :success
  end

  test "should create build_component" do
    assert_difference("BuildComponent.count") do
      post build_components_url, params: { build_component: { build_id: @build_component.build_id, component_id: @build_component.component_id } }, as: :json
    end

    assert_response :created
  end

  test "should show build_component" do
    get build_component_url(@build_component), as: :json
    assert_response :success
  end

  test "should update build_component" do
    patch build_component_url(@build_component), params: { build_component: { build_id: @build_component.build_id, component_id: @build_component.component_id } }, as: :json
    assert_response :success
  end

  test "should destroy build_component" do
    assert_difference("BuildComponent.count", -1) do
      delete build_component_url(@build_component), as: :json
    end

    assert_response :no_content
  end
end
