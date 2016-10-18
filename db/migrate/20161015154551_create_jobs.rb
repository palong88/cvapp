class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.date :closing_date

      t.timestamps
    end
  end
end
