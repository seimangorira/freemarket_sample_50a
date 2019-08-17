class AddSalerIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :saler_id, :integer, null: false
  end
end
