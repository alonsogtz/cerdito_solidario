class CreateAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :additional_infos do |t|
      t.string :description
      t.string :image
      t.integer :user_id
      t.string :title

      t.timestamps

    end
  end
end
