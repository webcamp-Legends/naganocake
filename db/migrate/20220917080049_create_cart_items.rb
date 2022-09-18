class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :item,    null: false
      t.references :customer,null: false
      t.integer :amount,     null: false

      t.timestamps
    end
  end
end
