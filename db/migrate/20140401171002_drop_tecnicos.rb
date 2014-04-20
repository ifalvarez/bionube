class DropTecnicos < ActiveRecord::Migration
  def change
    drop_table :tecnicos
  end
end
