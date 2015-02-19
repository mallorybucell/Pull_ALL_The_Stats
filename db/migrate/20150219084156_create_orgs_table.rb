class CreateOrgsTable < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :org_name
      
      t.timestamps
      t.integer
    end
  end
end
