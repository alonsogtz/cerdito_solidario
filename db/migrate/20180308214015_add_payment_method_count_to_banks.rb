class AddPaymentMethodCountToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :payment_methods_count, :integer
  end
end
