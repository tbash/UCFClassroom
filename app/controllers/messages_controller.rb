class MessagesController < ApplicationController
  include ActionController::Live
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
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.new(message_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @channel }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def event
    response.headers['Conent-Type'] = "text/event-stream"
    start = Time.zone.now
    10.times do
      Message.uncached
        Message.where('created_at > ?', start).each do |message|
        response.stream.write "data: #{message}\n\n"
        strart = message.created_at
      end
        sleep 2
    end
  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :channel_id, :content)
    end
end
