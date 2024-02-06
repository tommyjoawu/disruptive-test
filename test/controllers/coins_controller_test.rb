require "test_helper"

class CoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin = coins(:one)
  end

  test "should get index" do
    get coins_url
    assert_response :success
  end

  test "should get new" do
    get new_coin_url
    assert_response :success
  end

  test "should create coin" do
    assert_difference("Coin.count") do
      post coins_url, params: { coin: { code: @coin.code, description: @coin.description, monthly_interest: @coin.monthly_interest } }
    end

    assert_redirected_to coin_url(Coin.last)
  end

  test "should show coin" do
    get coin_url(@coin)
    assert_response :success
  end

  test "should get edit" do
    get edit_coin_url(@coin)
    assert_response :success
  end

  test "should update coin" do
    patch coin_url(@coin), params: { coin: { code: @coin.code, description: @coin.description, monthly_interest: @coin.monthly_interest } }
    assert_redirected_to coin_url(@coin)
  end

  test "should destroy coin" do
    assert_difference("Coin.count", -1) do
      delete coin_url(@coin)
    end

    assert_redirected_to coins_url
  end
end
