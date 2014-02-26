class AddUbicacionToEquipos < ActiveRecord::Migration
  def change
    add_column :equipos, :sede, :string
    add_column :equipos, :ubicacion, :string
  end
end
