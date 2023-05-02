class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :next_migration_number
      t.timestamp :departure
      t.integer :duration
      t.references :departure_airport
      t.references :arrival_airport
      t.integer :business_seats
      t.integer :economy_seats
      t.timestamps
    end
  end
end
