class SalesInvoice < ApplicationRecord
    belongs_to :client
    has_many :sales_delivery_notes
    validates :client, presence: true
    validates :n_referencia, presence: true
end
