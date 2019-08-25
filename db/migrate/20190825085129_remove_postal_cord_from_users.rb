class RemovePostalCordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :postal_cord, :integer
  end
end
