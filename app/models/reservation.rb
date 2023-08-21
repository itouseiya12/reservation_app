class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :people, presence: true

  def sum_of_reserve_price
    (check_out - check_in) / 86400 * room.price * people 
  end
  
  def sum_of_day
    (check_out - check_in).to_i / 1.day
  end

end
