class CreateConstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :constructions do |t|
      t.string :cod_obra
      t.string :direccion
      t.belongs_to :client

      t.timestamps
    end
  end
end
