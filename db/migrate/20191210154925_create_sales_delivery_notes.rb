class CreateSalesDeliveryNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_delivery_notes do |t|
      t.string :n_referencia, null: false
      t.float :precio
      t.datetime :fecha
      t.string :descripcion

      t.belongs_to :construction, null: false
      t.belongs_to :sales_invoice, default: nil
      t.timestamps
    end
  end
end
