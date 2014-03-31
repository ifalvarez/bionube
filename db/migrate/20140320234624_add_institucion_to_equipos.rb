class AddInstitucionToEquipos < ActiveRecord::Migration
  def change
    add_reference :equipos, :institucion, index: true
  end
end
