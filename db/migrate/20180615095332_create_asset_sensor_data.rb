class CreateAssetSensorData < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_sensor_data do |t|
      t.references :machine_asset, foreign_key: true
      t.datetime :input_date
      t.decimal :asset_tempeture
      t.decimal :asset_quality_score_lf
      t.decimal :asset_quality_score_tdn

      t.timestamps
    end
  end
end
