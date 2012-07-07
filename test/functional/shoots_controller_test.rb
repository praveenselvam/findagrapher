require 'test_helper'

class ShootsControllerTest < ActionController::TestCase
  setup do
    @shoot = shoots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoot" do
    assert_difference('Shoot.count') do
      post :create, shoot: { name: @shoot.name }
    end

    assert_redirected_to shoot_path(assigns(:shoot))
  end

  test "should show shoot" do
    get :show, id: @shoot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shoot
    assert_response :success
  end

  test "should update shoot" do
    put :update, id: @shoot, shoot: { name: @shoot.name }
    assert_redirected_to shoot_path(assigns(:shoot))
  end

  test "should destroy shoot" do
    assert_difference('Shoot.count', -1) do
      delete :destroy, id: @shoot
    end

    assert_redirected_to shoots_path
  end
end
