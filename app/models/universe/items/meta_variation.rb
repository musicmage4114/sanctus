class MetaVariation < ApplicationRecord
  belongs_to :meta_variant, class_name:  'Item',
                            foreign_key: :meta_type_id,
                            primary_key: :type_id,
                            inverse_of:  :meta_variations
  belongs_to :base_variant, class_name:  'Item',
                            foreign_key: :base_type_id,
                            primary_key: :type_id,
                            inverse_of:  :meta_variations
  belongs_to :meta_group,   class_name:  'MetaItemGroup',
                            primary_key: :meta_group_id,
                            inverse_of:  :meta_variations
  
  alias_attribute :base_item, :base_variant
end
