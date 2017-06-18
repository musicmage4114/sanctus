class StructureOperation < ApplicationRecord
  self.primary_key = 'operation_id'
  
  has_many :dockable_structures, foreign_key: :operation_id,
                                 inverse_of:  :structure_operation
  
  belongs_to :caldari_station_type,  class_name:  'Item',
                                     primary_key: :type_id,
                                     inverse_of:  :structure_operations
  belongs_to :minmatar_station_type, class_name:  'Item',
                                     primary_key: :type_id,
                                     inverse_of:  :structure_operations
  belongs_to :amarr_station_type,    class_name:  'Item',
                                     primary_key: :type_id,
                                     inverse_of:  :structure_operations
  belongs_to :gallente_station_type, class_name:  'Item',
                                     primary_key: :type_id,
                                     inverse_of:  :structure_operations
  belongs_to :jove_station_type,     class_name:  'Item',
                                     primary_key: :type_id,
                                     inverse_of:  :structure_operations
end
