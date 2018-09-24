class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.references :model, foreign_key: true
      t.float :price
      t.string :currency, default: "TRY"

      t.timestamps
    end
  end
end
