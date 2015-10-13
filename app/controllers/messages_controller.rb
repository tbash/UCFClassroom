class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # POST /messages
  # POST /messages.json
  def create
    @classroom = Classroom.find(params[:classroom_id])
    @message = @classroom.messages.new(message_params)
    @message.user = current_user
    @message.save

    respond_to do |format|
      if @message.save
        format.html { redirect_to @classroom }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

    ActionCable.server.broadcast 'messages',
      message: @message.content,
      user: current_user.user_name

    head :ok
  end

  def render
    render status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :classroom_id, :content)
    end
end
