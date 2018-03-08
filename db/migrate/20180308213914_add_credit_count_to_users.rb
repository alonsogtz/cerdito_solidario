class AddCreditCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :credits_count, :integer
  end
end
