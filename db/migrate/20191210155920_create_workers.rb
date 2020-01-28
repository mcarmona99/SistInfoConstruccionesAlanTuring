class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :dni, null: false
      t.string :telefono
      t.string :email
      t.string :direccion
      t.string :nombre
      t.float :salario
      t.string :gremio
      
      t.timestamps
    end
  end
end
