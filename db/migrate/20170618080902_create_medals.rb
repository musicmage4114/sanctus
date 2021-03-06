class CreateMedals < ActiveRecord::Migration[5.1]
  def change
    create_table :medals, id: false do |t|
      t.integer    :medal_id,    null: false, index: { unique: true }
      t.belongs_to :corporation, null: false, index: true
      t.string     :title,       null: false
      t.string     :graphic,     null: false
      t.integer    :layer,       null: false
      t.integer    :part,        null: false
      t.text       :description
      t.integer    :color
    end
    add_foreign_key :medals, :corporations, primary_key: :corporation_id
  end
end
