class AddPaymentConfirmationCountToPaymentMethods < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_methods, :payment_confirmations_count, :integer
  end
end
