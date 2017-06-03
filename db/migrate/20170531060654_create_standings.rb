class CreateStandings < ActiveRecord::Migration[5.1]
  def change
    create_table :standings, id: false do |t|
      t.belongs_to :relationship, polymorphic: true, null: false, index: true
      t.belongs_to :character,    null: false, index: true
      t.float      :standing,     null: false, default: 0

      t.timestamps
    end
    add_foreign_key :standings, :characters, primary_key: :character_id
  end
end
