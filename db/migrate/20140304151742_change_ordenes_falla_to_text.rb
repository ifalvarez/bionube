class ChangeOrdenesFallaToText < ActiveRecord::Migration
  def change
    change_column :ordenes, :falla, :text
  end
end
