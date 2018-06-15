class AssetSensorDatum < ApplicationRecord
  belongs_to :machine_asset
  require 'CSV'

  file = file.path if file.is_a?(File)
  print file
  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      AssetSensorDatum.create! row.to_hash
    end
  end
end
