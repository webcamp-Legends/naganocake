class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :customer,null: false
      t.string :name,        null: false
      t.string :post_code,    null: false
      t.string :address,     null: false
      

      t.timestamps
    end
  end
end
