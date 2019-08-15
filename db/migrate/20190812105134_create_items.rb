class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,            null: false, index: true
      t.integer     :price,           null: false     
      t.integer     :state,           null: false      
      t.text        :introduction,    null: false     
      t.string      :brand   
      t.integer     :status,          null: false
      t.integer     :size
      t.integer     :delivery_fee,    null: false   
      t.integer     :delivery_method, null: false
      t.string      :city,            null: false   
      t.date        :delivery_days,   null: false   
      t.references  :category,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
