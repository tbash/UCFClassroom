require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, params: { course: { description: @course.description, instructor_id: @course.instructor_id, name: @course.name } }
    end

    assert_response 201
  end

  test "should show course" do
    get :show, params: { id: @course }
    assert_response :success
  end

  test "should update course" do
    patch :update, params: { id: @course, course: { description: @course.description, instructor_id: @course.instructor_id, name: @course.name } }
    assert_response 200
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, params: { id: @course }
    end

    assert_response 204
  end
end
