class Client < ApplicationRecord
    validates :NIF_C, presence: true
    has_many :constructions, dependent: :destroy
    has_many :sales_invoices, dependent: :destroy

end
