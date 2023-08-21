class RoomsController < ApplicationController
  
  def index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to :rooms
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to :rooms
  end  

  def destroy
    @rooms = Room.find(params[:id])
    @rooms.destroy
    redirect_to :rooms
  end 

  def search
    search_word  = params[:word]
    @rooms = Room.where("roomname LIKE ? or roominfo LIKE ?  " ,"%#{search_word}%","%#{search_word}%")
  end

  def searcharea
    search_word  = params[:word]
    @rooms = Room.where("address LIKE ?","%#{search_word }%")
  end  

  private
  def room_params
    params.require(:room).permit(:roomname,:roominfo,:price,:address,:roomimage)
  end  
end
