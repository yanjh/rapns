require 'test_helper'

class PgroupsControllerTest < ActionController::TestCase
  setup do
    @pgroup = pgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pgroup" do
    assert_difference('Pgroup.count') do
      post :create, pgroup: { description: @pgroup.description, flag: @pgroup.flag, name: @pgroup.name, papp_id: @pgroup.papp_id }
    end

    assert_redirected_to pgroup_path(assigns(:pgroup))
  end

  test "should show pgroup" do
    get :show, id: @pgroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pgroup
    assert_response :success
  end

  test "should update pgroup" do
    put :update, id: @pgroup, pgroup: { description: @pgroup.description, flag: @pgroup.flag, name: @pgroup.name, papp_id: @pgroup.papp_id }
    assert_redirected_to pgroup_path(assigns(:pgroup))
  end

  test "should destroy pgroup" do
    assert_difference('Pgroup.count', -1) do
      delete :destroy, id: @pgroup
    end

    assert_redirected_to pgroups_path
  end
end
