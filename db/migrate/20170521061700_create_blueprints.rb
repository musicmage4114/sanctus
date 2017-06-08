class CreateBlueprints < ActiveRecord::Migration[5.0]
  def change
    create_table :blueprints, id: false do |t|
      t.integer    :type_id,      null: false, index: { unique: true }
      t.belongs_to :group,        null: false, index: true
      t.string     :name,         null: false
      t.integer    :data_export,  null: false, default: 1, index: true
      t.belongs_to :graphic,      index: true
      t.belongs_to :market_group, index: true
      t.text       :description
      t.float      :volume
    end
    add_foreign_key :personal_blueprints, :blueprints, column: :type_id,
                                                       primary_key: :type_id
  end
end
