require 'test_helper'

class SlideContainersControllerTest < ActionController::TestCase
  setup do
    @slide_container = slide_containers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create slide_container" do
    assert_difference('SlideContainer.count') do
      post :create, params: { slide_container: { course_id: @slide_container.course_id, course_session_id: @slide_container.course_session_id } }
    end

    assert_response 201
  end

  test "should show slide_container" do
    get :show, params: { id: @slide_container }
    assert_response :success
  end

  test "should update slide_container" do
    patch :update, params: { id: @slide_container, slide_container: { course_id: @slide_container.course_id, course_session_id: @slide_container.course_session_id } }
    assert_response 200
  end

  test "should destroy slide_container" do
    assert_difference('SlideContainer.count', -1) do
      delete :destroy, params: { id: @slide_container }
    end

    assert_response 204
  end
end
