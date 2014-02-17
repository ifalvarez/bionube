class AddEquipoToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :equipo, index: true
  end
end
