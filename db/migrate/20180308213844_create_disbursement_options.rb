class CreateDisbursementOptions < ActiveRecord::Migration
  def change
    create_table :disbursement_options do |t|
      t.integer :bank_id
      t.string :account_number
      t.integer :beneficiary_id

      t.timestamps

    end
  end
end
