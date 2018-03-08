class AddPaymentConfirmationCountToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :payment_confirmations_count, :integer
  end
end
