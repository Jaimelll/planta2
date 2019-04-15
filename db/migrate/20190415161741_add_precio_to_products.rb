class AddPrecioToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :admin_user_id, :integer
    add_index  :products, :admin_user_id
    add_column :products, :codigo, :string 
    add_column :products, :precio, :float    
    add_column :products, :costo, :float 
    add_column :products, :unidad, :integer 
    add_column :products, :seccion, :integer  
    add_column :products, :inventario, :float
    add_column :products, :pedido, :float
    add_column :products, :clase, :integer
    add_column :products, :familia, :integer
    add_column :products, :nivel, :integer
    add_column :products, :fecha1, :date
    add_column :products, :activo, :integer
  end  
end
