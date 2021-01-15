class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string  :postal_code,            null: false
      t.integer :prefecture_id,          null: false
      t.string  :city,                   null: false
      t.string  :addresses,              null: false
      t.string  :building
      t.string  :phone_number,           null: false
      t.integer :record_id,                 null: false

      t.timestamps
    end
  end
end
