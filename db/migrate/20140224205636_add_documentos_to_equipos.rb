class AddDocumentosToEquipos < ActiveRecord::Migration
  def change
    add_reference :equipos, :documentos, index: true
  end
end
