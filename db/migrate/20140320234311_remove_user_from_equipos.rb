class RemoveUserFromEquipos < ActiveRecord::Migration
  def change
    remove_column :equipos, :institucion_id
  end
end
