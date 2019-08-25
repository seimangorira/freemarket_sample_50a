class RemoveBuildingNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :building_name, :string
  end
end
