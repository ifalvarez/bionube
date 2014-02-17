class CreateTecnicos < ActiveRecord::Migration
  def change
    create_table :tecnicos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
