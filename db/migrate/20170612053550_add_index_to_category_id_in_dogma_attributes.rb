class AddIndexToCategoryIdInDogmaAttributes < ActiveRecord::Migration[5.1]
  def change
    add_index :dogma_attributes, :category_id
  end
end
