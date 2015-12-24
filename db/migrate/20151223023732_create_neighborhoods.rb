class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :barrio
      t.date :fecha_entrega

      t.timestamps null: false
    end
  end
end
