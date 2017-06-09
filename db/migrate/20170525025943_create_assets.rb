class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets, id: false do |t|
      t.integer    :item_id,        null: false, index: { unique: true }
      t.integer    :singleton,      null: false, default: 1, index: true
      t.string     :location_flag,  null: false
      t.belongs_to :location,       polymorphic: true, null: false, index: true
      t.belongs_to :ownable,        polymorphic: true, null: false, index: true
      t.belongs_to :owner,          polymorphic: true, null: false, index: true
      t.integer    :quantity
    end
  end
end
