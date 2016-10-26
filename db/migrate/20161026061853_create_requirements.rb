class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
      t.string :name
      t.integer :level
      t.integer :importance
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
