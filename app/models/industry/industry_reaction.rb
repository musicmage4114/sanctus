class IndustryReaction < ApplicationRecord
  belongs_to :reaction, class_name:  'Item',
                        foreign_key: :reaction_type_id,
                        primary_key: :type_id,
                        inverse_of:  :industry_reactions
  belongs_to :reagent,  class_name:  'Item',
                        foreign_key: :reagent_id,
                        primary_key: :type_id,
                        inverse_of:  :industry_reactions
end
