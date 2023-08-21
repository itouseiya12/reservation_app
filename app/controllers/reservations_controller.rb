class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = current_user.reservations
  end
  
  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    
    if @reservation.check_in.blank? || @reservation.check_out.blank? || @reservation.people.blank? 
      flash[:alert] = "全ての入力欄に入力を行ってください。"
      redirect_to request.referer
    elsif @reservation.check_out < @reservation.check_in
      flash[:alert] = "チェックイン日時はチェックアウト日時以降の日付にしてください。"
      redirect_to request.referer
    end
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to  :reservations, notice:"予約完了しました！"
    else 
      @room = Room.find(params[:id])
      render 'rooms/show'
    end  
  end  

  
  def destroy
    @reservation = Reservation.find(params[:room_id])
    @reservation.destroy
  end 
  
  private
  def reservation_params
    params.require(:reservation).permit(:user_id,:room_id,:check_in,:check_out,:people)
  end
  
end
