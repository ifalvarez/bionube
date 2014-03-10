class ChangeOrdenesFirmaToText < ActiveRecord::Migration
  def change
    change_column :ordenes, :firma, :text
  end
end
