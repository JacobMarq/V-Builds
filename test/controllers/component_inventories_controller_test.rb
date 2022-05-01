require "test_helper"

class ComponentInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_inventory = component_inventories(:one)
  end

  test "should get index" do
    get component_inventories_url, as: :json
    assert_response :success
  end

  test "should create component_inventory" do
    assert_difference("ComponentInventory.count") do
      post component_inventories_url, params: { component_inventory: { quantity: @component_inventory.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show component_inventory" do
    get component_inventory_url(@component_inventory), as: :json
    assert_response :success
  end

  test "should update component_inventory" do
    patch component_inventory_url(@component_inventory), params: { component_inventory: { quantity: @component_inventory.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy component_inventory" do
    assert_difference("ComponentInventory.count", -1) do
      delete component_inventory_url(@component_inventory), as: :json
    end

    assert_response :no_content
  end
end
