class AddSentMessageCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sent_messages_count, :integer
  end
end
