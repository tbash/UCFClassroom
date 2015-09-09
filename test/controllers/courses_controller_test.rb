require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { available: @course.available, description: @course.description, end_date: @course.end_date, instructor_id: @course.instructor_id, name: @course.name, session_days: @course.session_days, session_time: @course.session_time, start_date: @course.start_date, video_id: @course.video_id }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: { available: @course.available, description: @course.description, end_date: @course.end_date, instructor_id: @course.instructor_id, name: @course.name, session_days: @course.session_days, session_time: @course.session_time, start_date: @course.start_date, video_id: @course.video_id }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
