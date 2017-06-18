class Contraband < ApplicationRecord
  self.table_name = 'contraband'
  
  # Attribute :confiscate is the minimum security status at which the items
  # will be confiscated. Similarly, :attack is the minimum security status at
  # which faction police forces will attack a ship carrying the specified item.
  
  t.belongs_to :faction, primary_key: :faction_id, inverse_of: :contraband
  t.belongs_to :item,    foreign_key: :type_id,
                         primary_key: :type_id,
                         inverse_of:  :contraband
end
