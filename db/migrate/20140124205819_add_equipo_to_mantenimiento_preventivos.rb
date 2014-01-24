class AddEquipoToMantenimientoPreventivos < ActiveRecord::Migration
  def change
    add_reference :mantenimiento_preventivos, :equipo, index: true
  end
end
