class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :codigo
      t.integer :precio
      t.string :categoria
      t.string :subcategoria
      t.string :marca

      t.timestamps null: false
    end
  end
end
