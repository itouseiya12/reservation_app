class AddCountdaySumpriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :countday, :integer
    add_column :reservations, :sumprice, :integer
  end
end
