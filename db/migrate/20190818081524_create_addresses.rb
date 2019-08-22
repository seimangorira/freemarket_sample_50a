class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :first_name,         null: false
      t.string  :first_name_kana,    null: false
      t.string  :last_name,          null: false
      t.string  :last_name_kana,     null: false
      t.integer :postal_cord,        null: false
      t.string  :state,              null: false
      t.string  :municipalities,     null: false
      t.string  :house_number,       null: false
      t.string  :building_name
      t.integer :phone_number,       unique: true
      t.timestamps
    end
  end
end
