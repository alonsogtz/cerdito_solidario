class AddGroupCommentCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :group_comments_count, :integer
  end
end
