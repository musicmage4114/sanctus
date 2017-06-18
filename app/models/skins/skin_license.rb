class SkinLicense < ApplicationRecord
  self.primary_key = 'license_type_id'
  
  belongs_to :license_item, class_name: 'Item',
                            foreign_key: :license_type_id,
                            primary_key: :type_id,
                            inverse_of:  :skin_licenses
  belongs_to :skin,         primary_key: :skin_id,
                            inverse_of:  :skin_licenses
end
