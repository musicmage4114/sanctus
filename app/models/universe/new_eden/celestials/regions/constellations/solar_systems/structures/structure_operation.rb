class StructureOperation < ApplicationRecord
  self.primary_key = 'operation_id'
  
  enum activity_type: { agriculture: 1,
                        construction: 2,
                        mining: 3,
                        chemical: 4,
                        military: 5,
                        biotech: 6,
                        hi_tech: 7,
                        entertainment: 8,
                        shipyard: 9,
                        warehouse: 10,
                        retail: 11,
                        trading: 12,
                        bureaucratic: 13,
                        political: 14,
                        legal: 15,
                        security: 16,
                        financial: 17,
                        education: 18,
                        manufacture: 19,
                        disputed: 20 }
  
  has_many :dockable_structures, foreign_key: :operation_id,
                                 inverse_of:  :structure_operation
  has_many :operation_services,  foreign_key: :operation_id,
                                 inverse_of:  :structure_operation
  has_many :services, through: :operation_services, source: :service
  
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
