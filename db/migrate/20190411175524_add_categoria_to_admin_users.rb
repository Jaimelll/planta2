class AddCategoriaToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :categoria, :integer,  default: 0,  null: false
    add_column :admin_users, :periodo, :integer,  default: 0,  null: false
  end
end
