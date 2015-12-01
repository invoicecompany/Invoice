class AddColumnsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :nombrenegocio, :string
    add_column :customers, :nombrepropietario, :string
  end
end
