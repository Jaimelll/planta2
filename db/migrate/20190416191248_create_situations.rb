class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.float :cta
      t.string :cuenta
      t.string :detalle
      t.float :importe
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
