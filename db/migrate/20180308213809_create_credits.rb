class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.float :amount
      t.integer :group_id
      t.float :pricing
      t.string :comments
      t.string :weekly_payment
      t.boolean :status
      t.string :disbursement_confirmation
      t.string :disbursement_confirmation_image
      t.integer :disbursement_option_id

      t.timestamps

    end
  end
end
