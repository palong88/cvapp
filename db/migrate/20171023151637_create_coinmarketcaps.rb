class CreateCoinmarketcaps < ActiveRecord::Migration[5.0]
  def change
    create_table :coinmarketcaps do |t|

      t.timestamps
    end
  end
end
