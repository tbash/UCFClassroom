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
      post :create, course: { description: @course.description, end_date: @course.end_date, in_session: @course.in_session, mon: @course.mon, name: @course.name, session_time: @course.session_time, session_time_out: @course.session_time_out, start_date: @course.start_date, thu: @course.thu, tue: @course.tue, video_id: @course.video_id, wed: @course.wed }
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
    patch :update, id: @course, course: { description: @course.description, end_date: @course.end_date, in_session: @course.in_session, mon: @course.mon, name: @course.name, session_time: @course.session_time, session_time_out: @course.session_time_out, start_date: @course.start_date, thu: @course.thu, tue: @course.tue, video_id: @course.video_id, wed: @course.wed }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
