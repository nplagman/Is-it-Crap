require 'test_helper'

class NickspicksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nickspick = nickspicks(:one)
  end

  test "should get index" do
    get nickspicks_url
    assert_response :success
  end

  test "should get new" do
    get new_nickspick_url
    assert_response :success
  end

  test "should create nickspick" do
    assert_difference('Nickspick.count') do
      post nickspicks_url, params: { nickspick: { buylink: @nickspick.buylink, description: @nickspick.description, image: @nickspick.image, name: @nickspick.name, youtube: @nickspick.youtube } }
    end

    assert_redirected_to nickspick_url(Nickspick.last)
  end

  test "should show nickspick" do
    get nickspick_url(@nickspick)
    assert_response :success
  end

  test "should get edit" do
    get edit_nickspick_url(@nickspick)
    assert_response :success
  end

  test "should update nickspick" do
    patch nickspick_url(@nickspick), params: { nickspick: { buylink: @nickspick.buylink, description: @nickspick.description, image: @nickspick.image, name: @nickspick.name, youtube: @nickspick.youtube } }
    assert_redirected_to nickspick_url(@nickspick)
  end

  test "should destroy nickspick" do
    assert_difference('Nickspick.count', -1) do
      delete nickspick_url(@nickspick)
    end

    assert_redirected_to nickspicks_url
  end
end
