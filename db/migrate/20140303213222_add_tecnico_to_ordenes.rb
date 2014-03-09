class AddTecnicoToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :tecnico, index: true
  end
end
