require "test_helper"

class TypicalBuildUsagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @typical_build_usage = typical_build_usages(:one)
  end

  test "should get index" do
    get typical_build_usages_url, as: :json
    assert_response :success
  end

  test "should create typical_build_usage" do
    assert_difference("TypicalBuildUsage.count") do
      post typical_build_usages_url, params: { typical_build_usage: { cpu_precedent: @typical_build_usage.cpu_precedent, description: @typical_build_usage.description, gpu_precedent: @typical_build_usage.gpu_precedent, ram_space_suggestion: @typical_build_usage.ram_space_suggestion, title: @typical_build_usage.title } }, as: :json
    end

    assert_response :created
  end

  test "should show typical_build_usage" do
    get typical_build_usage_url(@typical_build_usage), as: :json
    assert_response :success
  end

  test "should update typical_build_usage" do
    patch typical_build_usage_url(@typical_build_usage), params: { typical_build_usage: { cpu_precedent: @typical_build_usage.cpu_precedent, description: @typical_build_usage.description, gpu_precedent: @typical_build_usage.gpu_precedent, ram_space_suggestion: @typical_build_usage.ram_space_suggestion, title: @typical_build_usage.title } }, as: :json
    assert_response :success
  end

  test "should destroy typical_build_usage" do
    assert_difference("TypicalBuildUsage.count", -1) do
      delete typical_build_usage_url(@typical_build_usage), as: :json
    end

    assert_response :no_content
  end
end
