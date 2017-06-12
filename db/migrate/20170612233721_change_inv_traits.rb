class ChangeInvTraits < ActiveRecord::Migration[5.1]
  class BonusTrait < ActiveRecord::Base
  end
  
  def change
    rename_table :invTraits, :bonus_traits
    change_table :bonus_traits do |t|
      t.rename :traitID, :trait_id
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :skillID, :skill_id
      t.index :skill_id
      t.rename :bonusText, :description
      t.rename :unitID, :unit_id
      t.index :unit_id
      t.index [:type_id, :trait_id]
      t.index [:trait_id, :skill_id]
    end
    add_foreign_key :bonus_traits, :items, column: :type_id, primary_key: :type_id
    add_foreign_key :bonus_traits, :units, primary_key: :unit_id
  end
  
  def data
    BonusTrait.reset_column_information
    BonusTrait.where(skill_id: -1).update_all(skill_id: nil)
    add_foreign_key :bonus_traits, :items, column: :skill_id, primary_key: :type_id
  end
  
  def rollback
    remove_foreign_key :bonus_traits, :items, column: :skill_id, primary_key: :type_id
    BonusTrait.reset_column_information
    BonusTrait.where(skill_id: nil).update_all(skill_id: -1)
  end
end
