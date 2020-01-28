class PurchasesDeliveryNote < ApplicationRecord
    belongs_to :construction
    belongs_to :provider
    belongs_to :purchase_invoice, required: false
    validates :construction, presence: true
    validates :provider, presence: true
    validates :n_referencia, presence: true
end
