class Worker < ApplicationRecord
    validates :dni, presence: true
    has_many :working_workers
end
