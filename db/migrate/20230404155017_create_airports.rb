class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :iata
      t.string :name
      t.timestamps
    end
    add_index :airports, :iata # add this line to create an index on iata column
  end
end
