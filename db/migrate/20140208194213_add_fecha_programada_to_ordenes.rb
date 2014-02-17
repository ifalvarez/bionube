class AddFechaProgramadaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :fecha_programada, :date
  end
end
