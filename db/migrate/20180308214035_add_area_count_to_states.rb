class AddAreaCountToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :areas_count, :integer
  end
end
