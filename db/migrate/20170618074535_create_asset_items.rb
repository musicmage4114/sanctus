class CreateAssetItems < ActiveRecord::Migration[5.1]
  def change
    create_table :asset_items, id: false do |t|
      t.integer    :item_id,        null: false, index: { unique: true }
      t.belongs_to :type,           null: false, index: true
      t.integer    :stack,          null: false, default: 1, index: true
      t.string     :location_flag,  null: false
      t.belongs_to :location,       polymorphic: true, null: false, index: true
      t.belongs_to :owner,          polymorphic: true, null: false, index: true
      t.integer    :quantity
    end
    add_foreign_key :asset_items, :items, column: :type_id, primary_key: :type_id
  end
end
