class ChangeDgmAttributeCategories < ActiveRecord::Migration[5.1]
  def change
    rename_table :dgmAttributeCategories, :dogma_attribute_categories
    change_table :dogma_attribute_categories do |t|
      t.rename :categoryID, :category_id
      t.rename :categoryName, :name
      t.rename :categoryDescription, :description
    end
  end
end
