class CreateMedalAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :medal_awards, id: false do |t|
      t.belongs_to :character, null: false, index: true
      t.belongs_to :medal,     null: false, index: true
      t.belongs_to :issuer,    null: false, index: true
      t.integer    :viewable,  null: false, default: 1, index: true
      t.datetime   :date,      null: false
      t.text       :reason
      
      t.index [:character_id, :medal_id]
      t.timestamps null: false
    end
    add_foreign_key :medal_awards, :characters, primary_key: :character_id
    add_foreign_key :medal_awards, :medals,     primary_key: :medal_id
    add_foreign_key :medal_awards, :characters, column: :issuer_id,
                    primary_key: :character_id
  end
end
