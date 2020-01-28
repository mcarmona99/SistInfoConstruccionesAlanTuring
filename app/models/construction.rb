class Construction < ApplicationRecord
    belongs_to :client
    has_many :sales_delivery_notes
    has_many :purchases_delivery_notes
    has_many :working_workers
    validates :client, presence: true
    validates :cod_obra, presence: true
end
