class AddRoomimageToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :roomimage, :string
  end
end
