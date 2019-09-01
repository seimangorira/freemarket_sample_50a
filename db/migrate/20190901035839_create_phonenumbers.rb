class CreatePhonenumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phonenumbers do |t|
      t.string :phone_number, null: false, unique: true 
      t.timestamps
    end
  end
end
