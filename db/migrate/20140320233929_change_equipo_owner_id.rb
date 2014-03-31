class ChangeEquipoOwnerId < ActiveRecord::Migration
  def change
    rename_column :equipos, :user_id, :institucion_id
  end
end
