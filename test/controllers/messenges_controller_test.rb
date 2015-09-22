require 'test_helper'

class MessengesControllerTest < ActionController::TestCase
  setup do
    @messenge = messenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create messenge" do
    assert_difference('Messenge.count') do
      post :create, messenge: { content: @messenge.content, sender: @messenge.sender }
    end

    assert_redirected_to messenge_path(assigns(:messenge))
  end

  test "should show messenge" do
    get :show, id: @messenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @messenge
    assert_response :success
  end

  test "should update messenge" do
    patch :update, id: @messenge, messenge: { content: @messenge.content, sender: @messenge.sender }
    assert_redirected_to messenge_path(assigns(:messenge))
  end

  test "should destroy messenge" do
    assert_difference('Messenge.count', -1) do
      delete :destroy, id: @messenge
    end

    assert_redirected_to messenges_path
  end
end
