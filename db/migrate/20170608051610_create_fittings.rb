class CreateFittings < ActiveRecord::Migration[5.1]
  def change
    create_table :fittings, id: false do |t|
      t.integer    :fitting_id, null: false, index: { unique: true }
      t.belongs_to :ship_type,  null: false, index: true
      t.belongs_to :creator,    index: true
      t.string     :name
      t.text       :description
    end
    add_foreign_key :fittings, :characters, column: :creator_id,
                                            primary_key: :character_id
  end
end
