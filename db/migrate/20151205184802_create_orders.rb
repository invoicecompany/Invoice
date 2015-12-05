class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :productos

      t.timestamps null: false
    end
  end
end
