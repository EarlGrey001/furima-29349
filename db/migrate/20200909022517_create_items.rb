class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :comment, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :shipping_days_id, null: false
      t.integer :shipping_state_id, null: false
      t.integer :shipping_origin_id, null: false
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
