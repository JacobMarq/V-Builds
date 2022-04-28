require "test_helper"

class ComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component = components(:one)
  end

  test "should get index" do
    get components_url, as: :json
    assert_response :success
  end

  test "should create component" do
    assert_difference("Component.count") do
      post components_url, params: { component: { brand: @component.brand, model: @component.model, part_number: @component.part_number, price: @component.price, stock: @component.stock, type_id: @component.type_id, ub_benchmark: @component.ub_benchmark, ub_link: @component.ub_link, ub_rank: @component.ub_rank, ub_samples: @component.ub_samples } }, as: :json
    end

    assert_response :created
  end

  test "should show component" do
    get component_url(@component), as: :json
    assert_response :success
  end

  test "should update component" do
    patch component_url(@component), params: { component: { brand: @component.brand, model: @component.model, part_number: @component.part_number, price: @component.price, stock: @component.stock, type_id: @component.type_id, ub_benchmark: @component.ub_benchmark, ub_link: @component.ub_link, ub_rank: @component.ub_rank, ub_samples: @component.ub_samples } }, as: :json
    assert_response :success
  end

  test "should destroy component" do
    assert_difference("Component.count", -1) do
      delete component_url(@component), as: :json
    end

    assert_response :no_content
  end
end
