class Provider < ApplicationRecord
    validates :NIF_P, presence: true
    has_many :purchase_invoices, dependent: :destroy
    has_many :purchases_delivery_notes
end
