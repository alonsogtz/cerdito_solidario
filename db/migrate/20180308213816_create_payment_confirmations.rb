class CreatePaymentConfirmations < ActiveRecord::Migration
  def change
    create_table :payment_confirmations do |t|
      t.integer :group_id
      t.date :date_posted
      t.string :image
      t.integer :payment_method_id

      t.timestamps

    end
  end
end
