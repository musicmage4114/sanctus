class CreateExtractorHeads < ActiveRecord::Migration[5.1]
  def change
    create_table :extractor_heads, id: false do |t|
      t.integer    :head_id, null: false, index: { unique: true }
      t.belongs_to :pin,     null: false, index: true
      t.float      :latitude
      t.float      :longitude
    end
    add_foreign_key :extractor_heads, :colony_pins, column: :pin_id,
                                                    primary_key: :pin_id
  end
end
