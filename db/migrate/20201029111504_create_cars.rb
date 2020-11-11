class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :color
      t.integer :rate

      t.timestamps
    end
  end
end
