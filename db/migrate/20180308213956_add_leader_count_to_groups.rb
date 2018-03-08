class AddLeaderCountToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :leaders_count, :integer
  end
end
