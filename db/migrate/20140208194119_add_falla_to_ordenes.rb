class AddFallaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :falla, :string
  end
end
