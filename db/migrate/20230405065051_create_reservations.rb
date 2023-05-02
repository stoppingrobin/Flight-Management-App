class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :pnr
      t.integer :nb_seats
      t.integer :category # 0 -> economy, 1 -> business
      t.integer :status # 0 -> active, 1 -> ended, 2 -> cancelled
      t.timestamps
    end
  end
end
