class AddDisbursementOptionCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :disbursement_options_count, :integer
  end
end
