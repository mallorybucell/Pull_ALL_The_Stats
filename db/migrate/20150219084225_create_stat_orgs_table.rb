class CreateStatOrgsTable < ActiveRecord::Migration
  def change
    create_table :stat_orgs do |t|
      t.belongs_to :stats
      t.belongs_to :organizations
    end
  end
end
