require "application_system_test_case"

class CoinsTest < ApplicationSystemTestCase
  setup do
    @coin = coins(:one)
  end

  test "visiting the index" do
    visit coins_url
    assert_selector "h1", text: "Coins"
  end

  test "should create coin" do
    visit coins_url
    click_on "New coin"

    fill_in "Code", with: @coin.code
    fill_in "Description", with: @coin.description
    fill_in "Monthly interest", with: @coin.monthly_interest
    click_on "Create Coin"

    assert_text "Coin was successfully created"
    click_on "Back"
  end

  test "should update Coin" do
    visit coin_url(@coin)
    click_on "Edit this coin", match: :first

    fill_in "Code", with: @coin.code
    fill_in "Description", with: @coin.description
    fill_in "Monthly interest", with: @coin.monthly_interest
    click_on "Update Coin"

    assert_text "Coin was successfully updated"
    click_on "Back"
  end

  test "should destroy Coin" do
    visit coin_url(@coin)
    click_on "Destroy this coin", match: :first

    assert_text "Coin was successfully destroyed"
  end
end
