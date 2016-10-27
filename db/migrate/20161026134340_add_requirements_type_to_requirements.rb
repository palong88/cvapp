class AddRequirementsTypeToRequirements < ActiveRecord::Migration[5.0]
  def change
    add_column :requirements, :requirement_type, :string
  end
end
