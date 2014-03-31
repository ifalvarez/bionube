class AddInstitucionToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :institucion, index: true
  end
end
