require 'test_helper'

class PmessagesControllerTest < ActionController::TestCase
  setup do
    @pmessage = pmessages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pmessages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pmessage" do
    assert_difference('Pmessage.count') do
      post :create, pmessage: { badge: @pmessage.badge, content: @pmessage.content, flag: @pmessage.flag, pgroup_id: @pmessage.pgroup_id, sound: @pmessage.sound }
    end

    assert_redirected_to pmessage_path(assigns(:pmessage))
  end

  test "should show pmessage" do
    get :show, id: @pmessage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pmessage
    assert_response :success
  end

  test "should update pmessage" do
    put :update, id: @pmessage, pmessage: { badge: @pmessage.badge, content: @pmessage.content, flag: @pmessage.flag, pgroup_id: @pmessage.pgroup_id, sound: @pmessage.sound }
    assert_redirected_to pmessage_path(assigns(:pmessage))
  end

  test "should destroy pmessage" do
    assert_difference('Pmessage.count', -1) do
      delete :destroy, id: @pmessage
    end

    assert_redirected_to pmessages_path
  end
end
