class RemoveNombreFromTecnicos < ActiveRecord::Migration
  def change
    remove_column :tecnicos, :nombre
  end
end
