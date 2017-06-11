class CreateOpportunityConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunity_connections, id: false do |t|
      t.belongs_to :group,           null: false, index: true
      t.belongs_to :connected_group, null: false, index: true
      
      t.index [:group_id, :connected_group_id], unique: true,
                                                name: 'connected_groups_index'
    end
    add_foreign_key :opportunity_connections, :opportunity_groups, column: :group_id,
                                                                   primary_key: :group_id
    add_foreign_key :opportunity_connections, :opportunity_groups, column: :connected_group_id,
                                                                   primary_key: :group_id
  end
end
