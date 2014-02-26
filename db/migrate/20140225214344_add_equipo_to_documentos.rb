class AddEquipoToDocumentos < ActiveRecord::Migration
  def change
    add_reference :documentos, :equipo, index: true
  end
end
