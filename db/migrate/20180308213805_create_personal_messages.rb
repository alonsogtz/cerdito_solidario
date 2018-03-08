class CreatePersonalMessages < ActiveRecord::Migration
  def change
    create_table :personal_messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :message

      t.timestamps

    end
  end
end
