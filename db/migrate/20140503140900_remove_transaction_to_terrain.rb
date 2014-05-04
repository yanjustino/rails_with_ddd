class RemoveTransactionToTerrain < ActiveRecord::Migration
  def change
    remove_column :terrains, :transaction, :string
  end
end
