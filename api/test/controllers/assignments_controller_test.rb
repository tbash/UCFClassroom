require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post :create, params: { assignment: { course_id: @assignment.course_id, due: @assignment.due, grade: @assignment.grade, user_id: @assignment.user_id, title: @assignment.title, assignmen_type: @assignment.assignment_type } }
    end

    assert_response 201
  end

  test "should show assignment" do
    get :show, params: { id: @assignment }
    assert_response :success
  end

  test "should update assignment" do
    patch :update, params: { id: @assignment, assignment: { course_id: @assignment.course_id, due: @assignment.due, grade: @assignment.grade, user_id: @assignment.user_id, title: @assignment.title, assignmen_type: @assignment.assignment_type } }
    assert_response 200
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete :destroy, params: { id: @assignment }
    end

    assert_response 204
  end
end
