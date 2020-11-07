class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :quantity, default: 1
      t.decimal :size
      t.decimal :total

      t.timestamps
    end
  end
end
