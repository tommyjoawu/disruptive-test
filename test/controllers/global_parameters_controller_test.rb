require "test_helper"

class GlobalParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @global_parameter = global_parameters(:one)
  end

  test "should get index" do
    get global_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_global_parameter_url
    assert_response :success
  end

  test "should create global_parameter" do
    assert_difference("GlobalParameter.count") do
      post global_parameters_url, params: { global_parameter: { code: @global_parameter.code, description: @global_parameter.description } }
    end

    assert_redirected_to global_parameter_url(GlobalParameter.last)
  end

  test "should show global_parameter" do
    get global_parameter_url(@global_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_global_parameter_url(@global_parameter)
    assert_response :success
  end

  test "should update global_parameter" do
    patch global_parameter_url(@global_parameter), params: { global_parameter: { code: @global_parameter.code, description: @global_parameter.description } }
    assert_redirected_to global_parameter_url(@global_parameter)
  end

  test "should destroy global_parameter" do
    assert_difference("GlobalParameter.count", -1) do
      delete global_parameter_url(@global_parameter)
    end

    assert_redirected_to global_parameters_url
  end
end
