class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.references :brand, foreign_key: true
      t.string :name
      t.string :fuel_type
      t.integer :engine_size
      t.integer :power
      t.string :power_unit
      t.integer :torque
      t.string :transmission
      t.string :acceleration
      t.float :urban_consumption
      t.float :extra_urban_consumption
      t.float :combined_consumption
      t.integer :top_speed

      t.timestamps
    end
  end
end
