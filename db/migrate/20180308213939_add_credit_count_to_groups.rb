class AddCreditCountToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :credits_count, :integer
  end
end
