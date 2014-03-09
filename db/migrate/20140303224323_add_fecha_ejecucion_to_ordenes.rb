class AddFechaEjecucionToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :fechaEjecucion, :date
  end
end
