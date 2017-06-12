class ChangeChrAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_table :chrAttributes, :training_attributes
    change_table :training_attributes do |t|
      t.rename :attributeID, :attribute_id
      t.rename :attributeName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :shortDescription, :short_description
    end
  end
end
