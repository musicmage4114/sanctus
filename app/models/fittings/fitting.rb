class Fitting < ApplicationRecord
  self.primary_key = 'fitting_id'
  
  belongs_to :creator, class_name: 'Character',    inverse_of: :fittings
  belongs_to :ship,    foreign_key: :ship_type_id, inverse_of: :fittings
  
  has_many :fitting_items, inverse_of: :fitting
end
