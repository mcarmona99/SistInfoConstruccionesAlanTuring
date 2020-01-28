class WorkingWorker < ApplicationRecord
    belongs_to :construction
    belongs_to :worker
    validates :construction, presence: true
    validates :worker, presence: true
    validates :fecha_ini, presence: true
    validates :fecha_fin, presence: true    
end
