class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :NIF_C, null: false
      t.string :razon_social
      t.string :direccion
      t.string :tlf
      t.string :mail
      
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
  
