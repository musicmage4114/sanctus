class CreateOpportunities < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunities, id: false do |t|
      t.integer    :task_id, null: false, index: { unique: true }
      t.belongs_to :group,   null: false, index: true
      t.string     :name
      t.text       :description
      t.text       :notification
    end
    add_foreign_key :opportunities, :opportunity_groups, column: :group_id,
                                                         primary_key: :group_id
  end
end
