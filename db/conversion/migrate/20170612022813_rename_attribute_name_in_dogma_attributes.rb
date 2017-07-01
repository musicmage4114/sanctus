class RenameAttributeNameInDogmaAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_column :dogma_attributes, :attributeName, :name
  end
end
