class MachineAsset < ApplicationRecord
  has_many :asset_sensor_datum, dependent: :destroy
end
