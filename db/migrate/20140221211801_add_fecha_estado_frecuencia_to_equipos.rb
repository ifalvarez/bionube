class AddFechaEstadoFrecuenciaToEquipos < ActiveRecord::Migration
  def change
    add_column :equipos, :fechaIngreso, :date
    add_column :equipos, :estado, :integer
    add_column :equipos, :frecuenciaPreventivo, :integer
    add_column :equipos, :frecuenciaMetrologia, :integer
  end
end
