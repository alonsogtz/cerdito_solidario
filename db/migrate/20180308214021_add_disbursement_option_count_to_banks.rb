class AddDisbursementOptionCountToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :disbursement_options_count, :integer
  end
end
