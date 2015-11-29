class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  before_action :set_user

  # GET /courses
  def index
    if @user.admin?
      @courses = Course.all
    else
      @courses = @user.courses
    end
    
    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # POST /courses/1/new_message
  def create_message
    @course.messages.creat(course_params[:message])
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    if @user.admin?
      @course.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
    
    # Uses the headers from the request and parses the auth token form this to find the current
    # user based on this as they are unique
    def set_user
      @user = User.find_by(authentication_token: headers[:access_token])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :description, :instructor_id, :course_session_id, :message => [:user_id, :content])
    end
end
