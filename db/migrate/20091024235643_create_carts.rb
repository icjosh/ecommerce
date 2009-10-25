class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.integer :product_id
      t.integer :cart_id
      t.decimal :price
      t.decimal :amount
      
      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
