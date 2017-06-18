class Fitting < ApplicationRecord
  self.primary_key = 'fitting_id'
  
  belongs_to :creator, class_name:  'Character',
                       primary_key: :character_id,
                       inverse_of:  :fittings
  belongs_to :ship,    class_name:  'Item',
                       foreign_key: :ship_type_id,
                       primary_key: :type_id,
                       inverse_of:  :fittings
  
  has_many :fitting_items, inverse_of: :fitting
end
