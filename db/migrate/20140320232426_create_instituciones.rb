class CreateInstituciones < ActiveRecord::Migration
  def change
    create_table :instituciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
