class AddUserRefToEquipo < ActiveRecord::Migration
  def change
    add_reference :equipos, :user, index: true
  end
end
