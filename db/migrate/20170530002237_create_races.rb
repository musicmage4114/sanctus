class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races, id: false do |t|
      t.integer    :race_id,  null: false, index: { unique: true }
      t.belongs_to :alliance, null: false, index: true
      t.string     :name,     null: false
      t.text       :description
    end
    add_foreign_key :races, :alliances,  primary_key: :alliance_id
    add_foreign_key :bloodlines, :races, primary_key: :race_id
  end
end
