class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :NIF_P, null: false
      t.string :razon_social
      t.string :direccion
      t.string :tlf
      t.string :mail
      
      t.timestamps null: false
    end
  end
end
