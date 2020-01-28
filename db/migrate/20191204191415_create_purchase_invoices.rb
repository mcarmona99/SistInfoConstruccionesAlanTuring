class CreatePurchaseInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_invoices do |t|
      t.integer :n_factura, null: false
      t.belongs_to :provider, null: false

      t.timestamps
    end
  end
end
