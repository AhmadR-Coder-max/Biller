class CreateOrders < ActiveRecord::Migration[6.0]
  def up
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :total_bill
      t.text :item_names

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
