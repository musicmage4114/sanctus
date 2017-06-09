class Item < ApplicationRecord
  self.abstract_class = true

  has_many :assets,                 as: :ownable
  has_many :dogma_attribute_values, as: :entity
  has_many :dogma_effect_defaults,  as: :entity
  has_one  :blueprint,              as: :produceable
  has_many :required_skills,        as: :usable
  has_many :industry_jobs,          as: :product
  has_many :fitting_items,          as: :fitted_item
  has_many :killmail_drops,         as: :killmail_loot,
                                    class_name: 'KillmailItem'

  has_many :fittings,          through: :fitting_items,  source: :fitting
  has_many :killmails,         through: :killmail_items, source: :killmail
  has_many :dogma_attributes,  through: :dogma_attribute_values, source: :attribute
  has_many :dogma_effects,     through: :dogma_effect_defaults,  source: :dogma_effect
end
