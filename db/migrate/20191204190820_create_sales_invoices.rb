class CreateSalesInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_invoices do |t|
      t.integer :n_referencia, null: false
      t.belongs_to :client, null: false


      t.timestamps
    end
  end
end
