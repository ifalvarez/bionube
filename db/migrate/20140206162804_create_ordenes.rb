class CreateOrdenes < ActiveRecord::Migration
  def change
    create_table :ordenes do |t|
      t.string :solicitante
      t.integer :tipoOrden
      t.string :actividadRealizada
      t.string :personaRecibe
      t.decimal :valor

      t.timestamps
    end
  end
end
