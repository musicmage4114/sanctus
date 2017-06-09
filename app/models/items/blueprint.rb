class Blueprint < Item
  self.primary_key = 'type_id'

  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_group,           foreign_key: :group_id, inverse_of: :blueprints
  belongs_to :graphic,              inverse_of:  :blueprints
  belongs_to :market_group,         inverse_of:  :blueprints
  belongs_to :produceable,          polymorphic: true

  has_many :personal_blueprints,    foreign_key: :type_id, inverse_of: :blueprint
  has_many :materials,              class_name:  'BlueprintMaterial',
                                    inverse_of:  :blueprint
  
  alias_attribute :group, :item_group
end
