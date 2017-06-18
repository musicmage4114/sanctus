class StationDetail < ApplicationRecord
  belongs_to :station_type, class_name:  'Item',
                            foreign_key: :station_type_id,
                            primary_key: :type_id,
                            inverse_of:  :station_details
  belongs_to :operation,    class_name:  'StructureOperation',
                            foreign_key: :operation_id,
                            primary_key: :operation_id,
                            inverse_of:  :station_details
end
