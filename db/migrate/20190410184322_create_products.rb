class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :orden
      t.integer :cantidad
      t.integer :sele1
      t.integer :sele2      
      t.integer :sele3
      t.integer :sele4    
      t.string :str1
      t.string :str1
      t.float :num1
      t.timestamps
    end
  end
end
