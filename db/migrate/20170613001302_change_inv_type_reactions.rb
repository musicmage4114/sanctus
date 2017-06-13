class ChangeInvTypeReactions < ActiveRecord::Migration[5.1]
  def change
    rename_table :invTypeReactions, :industry_reactions
    change_table :industry_reactions do |t|
      t.rename :reactionTypeID, :reaction_type_id
      t.index :reaction_type_id
      t.rename :typeID, :reagent_id
      t.index :reagent_id
      t.index [:reaction_type_id, :reagent_id], name: 'reaction_reagent_type_id_index'
    end
    add_foreign_key :industry_reactions, :items, column: :reaction_type_id,
                                                 primary_key: :type_id
    add_foreign_key :industry_reactions, :items, column: :reagent_id,
                                                 primary_key: :type_id
  end
end
