class ChangeDgmEffects < ActiveRecord::Migration[5.1]
  class DogmaEffect < ActiveRecord::Base
  end
  
  def change
    rename_table :dgmEffects, :dogma_effects
    change_table :dogma_effects do |t|
      t.rename :effectID, :effect_id
      t.rename :effectCategory, :effect_category
      t.rename :preExpression, :pre_expression
      t.rename :postExpression, :post_expression
      t.rename :iconID, :icon_id
      t.rename :isOffensive, :offensive
      t.rename :isAssistance, :assistance
      t.rename :durationAttributeID, :duration_attribute_id
      t.index :duration_attribute_id
      t.rename :trackingSpeedAttributeID, :tracking_speed_attribute_id
      t.index :tracking_speed_attribute_id
      t.rename :dischargeAttributeID, :discharge_attribute_id
      t.index :discharge_attribute_id
      t.rename :rangeAttributeID, :range_attribute_id
      t.index :range_attribute_id
      t.rename :falloffAttributeID, :falloff_attribute_id
      t.index :falloff_attribute_id
      t.rename :rangeChance, :range_chance
      t.rename :electronicChance, :electronic_chance
      t.rename :propulsionChance, :propulsion_chance
      t.rename :sfxName, :sfx_name
      t.rename :npcUsageChanceAttributeID, :npc_usage_chance_attribute_id
      t.rename :npcActivationChanceAttributeID, :npc_activation_chance_attribute_id
      t.rename :fittingUsageChanceAttributeID, :fitting_usage_chance_attribute_id
      t.rename :modifierInfo, :modifier_info
    end
    add_foreign_key :dogma_effects, :dogma_attributes, column: :duration_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :tracking_speed_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :discharge_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :range_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :falloff_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :npc_usage_chance_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :npc_activation_chance_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :fitting_usage_chance_attribute_id,
                                                       primary_key: :attribute_id
  end
  
  def data
    change_table :dogma_effects do |t|
      t.integer :auto_repeat, null: false, default: 0, index: true
      t.integer :data_export, null: false, default: 1, index: true
      t.integer :warp_safety, null: false, default: 0, index: true
    end
    
    DogmaEffect.reset_column_information
    DogmaEffect.where(disallowAutoRepeat: true).update_all(auto_repeat: 1)
    DogmaEffect.where(published: false).update_all(data_export: 0)
    DogmaEffect.where(isWarpSafe: true).update_all(warp_safety: 1)
    
    change_table :dogma_effects do |t|
      t.remove :disallowAutoRepeat
      t.remove :published
      t.remove :isWarpSafe
    end
  end
  
  def rollback
    change_table :dogma_effects do |t|
      t.boolean :disallowAutoRepeat, default: false
      t.boolean :published, default: true
      t.boolean :isWarpSafe, default: false
    end
    
    DogmaEffect.reset_column_information
    DogmaEffect.where(auto_repeat: 1).update_all(disallowAutoRepeat: true)
    DogmaEffect.where(data_export: 0).update_all(published: false)
    DogmaEffect.where(warp_safety: 1).update_all(isWarpSafe: true)
    
    change_table :dogma_effects do |t|
      t.remove :auto_repeat
      t.remove :data_export
      t.remove :warp_safety
    end
  end
end
