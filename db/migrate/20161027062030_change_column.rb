class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :requirements, :level, :string
  end
end
