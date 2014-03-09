class AddNombreToTecnicos < ActiveRecord::Migration
  def change
    add_column :tecnicos, :nombre, :string
  end
end
