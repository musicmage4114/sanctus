class IndustryInstallation < ApplicationRecord
  belongs_to :structure_type, class_name: 'Item',
                              foreign_key: :installation_type_id,
                              primary_key: :type_id,
                              inverse_of:  :industry_installations
  belongs_to :assembly_line,  primary_key: :assembly_line_id,
                              inverse_of:  :industry_installations
end
