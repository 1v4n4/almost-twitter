require "test_helper"

class TvitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tvit = tvits(:one)
  end

  test "should get index" do
    get tvits_url
    assert_response :success
  end

  test "should get new" do
    get new_tvit_url
    assert_response :success
  end

  test "should create tvit" do
    assert_difference('Tvit.count') do
      post tvits_url, params: { tvit: { tvit: @tvit.tvit } }
    end

    assert_redirected_to tvit_url(Tvit.last)
  end

  test "should show tvit" do
    get tvit_url(@tvit)
    assert_response :success
  end

  test "should get edit" do
    get edit_tvit_url(@tvit)
    assert_response :success
  end

  test "should update tvit" do
    patch tvit_url(@tvit), params: { tvit: { tvit: @tvit.tvit } }
    assert_redirected_to tvit_url(@tvit)
  end

  test "should destroy tvit" do
    assert_difference('Tvit.count', -1) do
      delete tvit_url(@tvit)
    end

    assert_redirected_to tvits_url
  end
end
