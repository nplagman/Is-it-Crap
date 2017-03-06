require 'test_helper'

class FavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fafe = faves(:one)
  end

  test "should get index" do
    get faves_url
    assert_response :success
  end

  test "should get new" do
    get new_fafe_url
    assert_response :success
  end

  test "should create fafe" do
    assert_difference('Fave.count') do
      post faves_url, params: { fafe: { buylink: @fafe.buylink, description: @fafe.description, image: @fafe.image, name: @fafe.name, youtube: @fafe.youtube } }
    end

    assert_redirected_to fafe_url(Fave.last)
  end

  test "should show fafe" do
    get fafe_url(@fafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_fafe_url(@fafe)
    assert_response :success
  end

  test "should update fafe" do
    patch fafe_url(@fafe), params: { fafe: { buylink: @fafe.buylink, description: @fafe.description, image: @fafe.image, name: @fafe.name, youtube: @fafe.youtube } }
    assert_redirected_to fafe_url(@fafe)
  end

  test "should destroy fafe" do
    assert_difference('Fave.count', -1) do
      delete fafe_url(@fafe)
    end

    assert_redirected_to faves_url
  end
end
