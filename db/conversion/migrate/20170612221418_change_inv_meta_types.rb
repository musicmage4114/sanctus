class ChangeInvMetaTypes < ActiveRecord::Migration[5.1]
  def change
    rename_table :invMetaTypes, :meta_variations
    change_table :meta_variations do |t|
      t.rename :typeID, :meta_type_id
      t.rename :parentTypeID, :base_type_id
      t.index :base_type_id
      t.rename :metaGroupID, :meta_group_id
      t.index :meta_group_id
      t.index [:base_type_id, :meta_type_id],  name: 'meta_base_type_id_index'
      t.index [:meta_type_id, :meta_group_id], name: 'meta_group_type_id_index'
    end
    add_foreign_key :meta_variations, :items,            column: :meta_type_id,
                                                         primary_key: :type_id
    add_foreign_key :meta_variations, :items,            column: :base_type_id,
                                                         primary_key: :type_id
    add_foreign_key :meta_variations, :meta_item_groups, column: :meta_group_id,
                                                         primary_key: :meta_group_id
  end
end
