class CreateWarAllies < ActiveRecord::Migration[5.1]
  def change
    create_table :war_allies, id: false do |t|
      t.belongs_to :war,  null: false, index: true
      t.belongs_to :ally, polymorphic: true, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :war_allies, :wars, primary_key: :war_id
  end
end
