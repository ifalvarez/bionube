class CreateRepuestos < ActiveRecord::Migration
  def change
    create_table :repuestos do |t|
      t.string :descripcion
      t.decimal :valor

      t.timestamps
    end
  end
end
