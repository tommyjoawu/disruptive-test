require "application_system_test_case"

class GlobalParametersTest < ApplicationSystemTestCase
  setup do
    @global_parameter = global_parameters(:one)
  end

  test "visiting the index" do
    visit global_parameters_url
    assert_selector "h1", text: "Global parameters"
  end

  test "should create global parameter" do
    visit global_parameters_url
    click_on "New global parameter"

    fill_in "Code", with: @global_parameter.code
    fill_in "Description", with: @global_parameter.description
    click_on "Create Global parameter"

    assert_text "Global parameter was successfully created"
    click_on "Back"
  end

  test "should update Global parameter" do
    visit global_parameter_url(@global_parameter)
    click_on "Edit this global parameter", match: :first

    fill_in "Code", with: @global_parameter.code
    fill_in "Description", with: @global_parameter.description
    click_on "Update Global parameter"

    assert_text "Global parameter was successfully updated"
    click_on "Back"
  end

  test "should destroy Global parameter" do
    visit global_parameter_url(@global_parameter)
    click_on "Destroy this global parameter", match: :first

    assert_text "Global parameter was successfully destroyed"
  end
end
