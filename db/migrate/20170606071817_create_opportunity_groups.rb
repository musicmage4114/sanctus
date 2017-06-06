class CreateOpportunityGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunity_groups, id: false do |t|
      t.integer :group_id, null: false, index: { unique: true }
      t.string  :name
      t.text    :description
      t.text    :notification
    end
  end
end
