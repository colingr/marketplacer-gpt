class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.float :total_cost

      t.timestamps
    end
  end
end
