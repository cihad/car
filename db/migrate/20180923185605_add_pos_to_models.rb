class AddPosToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :pos, :integer
  end
end
