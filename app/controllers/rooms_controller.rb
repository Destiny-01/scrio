class RoomsController < ApplicationController
  
  
  before_action :set_room, only: %i[show edit update destroy ]
  before_action :se_room

  # GET /rooms or /rooms.json
  def home
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @rooms = Room.all
    render 'home'
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def se_room
    @rooms = Room.all
    # @udi = current_user.id
    @user = current_user
  end
  
  def room_params
    params.require(:room).permit(:name)
  end
end
