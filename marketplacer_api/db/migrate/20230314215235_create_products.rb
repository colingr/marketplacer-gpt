class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :uuid
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
