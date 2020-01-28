class CreateWorkingWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :working_workers do |t|
      t.belongs_to :construction, null: false
      t.belongs_to :worker, null: false
      t.datetime :fecha_ini, null: false
      t.datetime :fecha_fin, null: false

      t.timestamps
    end
  end
end
