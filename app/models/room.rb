class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  validates :roomname, presence: true
  validates :roominfo, presence: true
  validates :price, presence: true
  validates :address, presence: true

  mount_uploader :roomimage, RoomimageUploader
end
