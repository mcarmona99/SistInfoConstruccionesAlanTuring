class SalesDeliveryNote < ApplicationRecord
    belongs_to :construction
    belongs_to :sales_invoice, required: false
    validates :construction, presence: true
    validates :n_referencia, presence: true
end
