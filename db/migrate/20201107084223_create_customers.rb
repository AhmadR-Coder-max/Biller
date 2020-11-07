class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :address_1
      t.text :address_2
      t.string :phone_1, default: '+92 '
      t.string :phone_2, default: '+92 '

      t.timestamps
    end
  end
end
