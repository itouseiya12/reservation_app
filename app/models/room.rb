class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  validates :roomname, presence: true
  validates :roominfo, presence: true
  validates :price, presence: true ,numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :address, presence: true

  mount_uploader :roomimage, RoomimageUploader
end
