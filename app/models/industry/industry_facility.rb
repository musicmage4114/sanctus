class IndustryFacility < ApplicationRecord
  belongs_to :facility,      class_name:  'Station',
                             foreign_key: :facility_id,
                             primary_key: :station_id,
                             inverse_of:  :industry_facilities
  belongs_to :solar_system,  primary_key: :system_id,
                             inverse_of:  :industry_facilities
  belongs_to :industry_type, class_name: 'Item',
                             foreign_key: :industry_type_id,
                             primary_key: :type_id,
                             inverse_of:  :industry_facilities
  belongs_to :station_type,  class_name:  'Item',
                             foreign_key: :station_type_id,
                             primary_key: :type_id,
                             inverse_of:  :industry_facilities
  belongs_to :region,        primary_key: :region_id,
                             inverse_of: :industry_facilities
end
