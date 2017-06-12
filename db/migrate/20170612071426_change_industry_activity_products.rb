class ChangeIndustryActivityProducts < ActiveRecord::Migration[5.1]
  def change
    rename_table :industryActivityProducts, :blueprint_products
    change_table :blueprint_products do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :productTypeID, :product_type_id
      t.index [:blueprint_id, :product_type_id], name: 'blueprint_product_type_id_product_index'
    end
    add_foreign_key :blueprint_products, :industry_activities, column: :activity_type,
                                                               primary_key: :activity_id
  end
end
