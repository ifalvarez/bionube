class AddFirmaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :firma, :string
  end
end
