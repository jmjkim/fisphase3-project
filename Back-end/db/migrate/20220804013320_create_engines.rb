class CreateEngines < ActiveRecord::Migration[6.1]
  def change
    create_table :engines do |t|
      t.integer :engine_department_id
      t.string :engine_type
      t.string :manufactured_engine_id
      t.string :associated_vehicle_vin
      t.string :engine_layout
      
      # Engine Components
      t.boolean :camshaft_built
      t.boolean :piston_built
      t.boolean :flywheel_built
      t.boolean :connecting_rod_built
      t.boolean :crankshaft_built
      t.boolean :sump_built
      t.boolean :camshaft_drive_belt_built

      t.text :remark
    end
  end
end
