class CreatePurchasesDeliveryNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases_delivery_notes do |t|
      t.string :n_referencia, null: false
      t.float :precio
      t.datetime :fecha
      t.string :descripcion

      t.belongs_to :construction, null: false
      t.belongs_to :provider, null: false
      t.belongs_to :purchase_invoice, default: nil
      t.timestamps
    end
  end
end
