class AddFechaEntregaToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :fecha_entrega, :datetime
  end
end
