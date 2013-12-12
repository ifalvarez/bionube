class CreateEquipos < ActiveRecord::Migration
  def change
    create_table :equipos do |t|
      t.string :equipo
      t.string :marca
      t.string :modelo
      t.string :serie
      t.string :inventario
      t.integer :tipo
      t.integer :clasificacion

      t.timestamps
    end
  end
end
