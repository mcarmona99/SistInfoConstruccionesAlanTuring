class PurchaseInvoice < ApplicationRecord
    belongs_to :provider
    has_many :purchases_delivery_notes
    validates :provider, presence: true
    validates :n_factura, presence: true
end
