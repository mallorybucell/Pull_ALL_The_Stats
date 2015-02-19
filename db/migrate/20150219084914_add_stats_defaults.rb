class AddStatsDefaults < ActiveRecord::Migration
  def change
    change_column :stats, :additions,     :integer, :default => 0
    change_column :stats, :deletions,     :integer, :default => 0
    change_column :stats, :total_changes, :integer, :default => 0
  end
end
