class AddGroupCommentCountToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :group_comments_count, :integer
  end
end
