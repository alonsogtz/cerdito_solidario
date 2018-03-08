class AddGroupCountToPaymentMethods < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_methods, :groups_count, :integer
  end
end
