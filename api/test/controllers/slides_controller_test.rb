require 'test_helper'

class SlidesControllerTest < ActionController::TestCase
  setup do
    @slide = slides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create slide" do
    assert_difference('Slide.count') do
      post :create, params: { slide: { content: @slide.content, course_id: @slide.course_id } }
    end

    assert_response 201
  end

  test "should show slide" do
    get :show, params: { id: @slide }
    assert_response :success
  end

  test "should update slide" do
    patch :update, params: { id: @slide, slide: { content: @slide.content, course_id: @slide.course_id } }
    assert_response 200
  end

  test "should destroy slide" do
    assert_difference('Slide.count', -1) do
      delete :destroy, params: { id: @slide }
    end

    assert_response 204
  end
end
