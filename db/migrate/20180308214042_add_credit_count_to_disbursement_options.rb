class AddCreditCountToDisbursementOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :disbursement_options, :credits_count, :integer
  end
end
