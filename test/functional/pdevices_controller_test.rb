require 'test_helper'

class PdevicesControllerTest < ActionController::TestCase
  setup do
    @pdevice = pdevices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdevices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdevice" do
    assert_difference('Pdevice.count') do
      post :create, pdevice: { flag: @pdevice.flag, token: @pdevice.token, user: @pdevice.user }
    end

    assert_redirected_to pdevice_path(assigns(:pdevice))
  end

  test "should show pdevice" do
    get :show, id: @pdevice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pdevice
    assert_response :success
  end

  test "should update pdevice" do
    put :update, id: @pdevice, pdevice: { flag: @pdevice.flag, token: @pdevice.token, user: @pdevice.user }
    assert_redirected_to pdevice_path(assigns(:pdevice))
  end

  test "should destroy pdevice" do
    assert_difference('Pdevice.count', -1) do
      delete :destroy, id: @pdevice
    end

    assert_redirected_to pdevices_path
  end
end
