class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :score
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
