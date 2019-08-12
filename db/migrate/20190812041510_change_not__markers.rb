class ChangeNotMarkers < ActiveRecord::Migration[5.2]
  def up
    # Not Null制約を外す
    change_column_null :categories, :ancestry, true
  end

  def down
    # もともとついていたNot Null制約を外す
    change_column_null :categories, :ancestry, false
  end
end
