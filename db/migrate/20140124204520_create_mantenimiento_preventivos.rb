class CreateMantenimientoPreventivos < ActiveRecord::Migration
  def change
    create_table :mantenimiento_preventivos do |t|
      t.date :fecha
      t.text :reporte

      t.timestamps
    end
  end
end
