class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :se_message

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    MessageJob.perform_later(@message)
    
    # MessageJob.perform_later(@message)
    # mine = ApplicationController.render(
    #   partial: 'messages/mine',
    #   locals: { message: @message }
    # )

    # user = current_user

    # RoomChannel.broadcast_to(
    #   "room_channel_5",
    #   ApplicationController.render(partial: 'messages/message')
    # )

    # ApplicationController.render_with_signed_in_user(
    #   @user,
    #   partial: 'messages/message',
    #   locals: { message: @message }
    # )
    # yours = ApplicationController.render(
    #   partial: 'messages/yours',
    #   locals: { message: @message }
    # )
    # html = ApplicationController.render(
    #  partial: 'messages/message',
    #  locals: { message: @message }
    # )

    # # # ActionCable.server.broadcast "room_channel_5", mine: mine, yours: yours, message: @message
    # ActionCable.server.broadcast "room_channel_#{@message.room_id}", html: html
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def se_message
      @ith = "kogi"
      # @udi = current_user.id
      # @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end
end
