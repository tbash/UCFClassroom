class SlideContainersController < ApplicationController
  before_action :set_slide_container, only: [:show, :update, :destroy]

  # GET /slide_containers
  def index
    @slide_containers = SlideContainer.all

    render json: @slide_containers
  end

  # GET /slide_containers/1
  def show
    render json: @slide_container
  end

  # POST /slide_containers
  def create
    @slide_container = SlideContainer.new(slide_container_params)

    if @slide_container.save
      render json: @slide_container, status: :created, location: @slide_container
    else
      render json: @slide_container.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slide_containers/1
  def update
    if @slide_container.update(slide_container_params)
      render json: @slide_container
    else
      render json: @slide_container.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slide_containers/1
  def destroy
    @slide_container.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide_container
      @slide_container = SlideContainer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def slide_container_params
      params.require(:slide_container).permit(:course_session_id, :course_id, :slides => [:order_no, :content])
    end
end
