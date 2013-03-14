class AddSerialNumberColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :serial_number, :string
    add_column :items, :stolen, :boolean
  end
end
