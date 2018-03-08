class AddGroupCountToCommunities < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :groups_count, :integer
  end
end
