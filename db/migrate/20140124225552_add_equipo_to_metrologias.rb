class AddEquipoToMetrologias < ActiveRecord::Migration
  def change
    add_reference :metrologias, :equipo, index: true
  end
end
