class AddEstadoToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :estado, :integer
  end
end
