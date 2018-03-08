class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :community_id
      t.integer :preferredp_mt_method_id
      t.string :comments
      t.date :begining_date
      t.date :end_date
      t.string :weekly_pmt
      t.string :total_principal

      t.timestamps

    end
  end
end
