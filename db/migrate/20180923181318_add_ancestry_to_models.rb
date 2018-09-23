class AddAncestryToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :ancestry, :string
    add_index :models, :ancestry
  end
end
