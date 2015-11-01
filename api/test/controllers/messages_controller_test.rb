require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, params: { message: { body: @message.body, course_id: @message.course_id, username: @message.username } }
    end

    assert_response 201
  end

  test "should show message" do
    get :show, params: { id: @message }
    assert_response :success
  end

  test "should update message" do
    patch :update, params: { id: @message, message: { body: @message.body, course_id: @message.course_id, username: @message.username } }
    assert_response 200
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, params: { id: @message }
    end

    assert_response 204
  end
end
