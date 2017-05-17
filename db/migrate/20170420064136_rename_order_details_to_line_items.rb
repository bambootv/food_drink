class RenameOrderDetailsToLineItems < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :order_details, :line_items
  end

  def self.down
    rename_table :line_items, :order_details
  end
end
