class AddLeaderCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :leaders_count, :integer
  end
end
