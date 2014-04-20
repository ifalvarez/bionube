class ChangeOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :tecnico_id
    remove_column :ordenes, :solicitante
    add_reference :ordenes, :solicitante, index: true
    add_reference :ordenes, :tecnico, index: true
    
  end
end
