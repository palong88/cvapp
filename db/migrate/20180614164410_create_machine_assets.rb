class CreateMachineAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :machine_assets do |t|
      t.integer :asset_number
      t.string :asset_name
      t.text :asset_description
      t.string :asset_location
      t.string :asset_owner
      t.string :asset_technician
      t.integer :asset_serial_number
      t.string :asset_fluid_type
      t.integer :asset_criticality
      t.integer :asset_status

      t.timestamps
    end
  end
end
