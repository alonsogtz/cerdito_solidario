class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :account_number
      t.integer :bank_id

      t.timestamps

    end
  end
end
