class CreateMetrologia < ActiveRecord::Migration
  def change
    create_table :metrologias do |t|
      t.date :fecha
      t.text :reporte

      t.timestamps
    end
  end
end
