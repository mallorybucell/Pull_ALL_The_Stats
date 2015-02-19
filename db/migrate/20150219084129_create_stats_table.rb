class CreateStatsTable < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string  :user
      t.integer :additions
      t.integer :deletions
      t.integer :total_changes

      t.timestamps
      t.integer
    end
  end
end
