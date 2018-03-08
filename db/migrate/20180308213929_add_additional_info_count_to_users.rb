class AddAdditionalInfoCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :additional_infos_count, :integer
  end
end
