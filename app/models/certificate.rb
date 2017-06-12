class Certificate < ApplicationRecord
  self.primary_key = 'cert_id'
  
  belongs_to :item_group,       foreign_key: :group_id, inverse_of: :certificates
  
  has_many :certificate_skills, foreign_key: :cert_id,  inverse_of: :certificate
  has_many :masteries,          class_name:  'CertificateMastery',
                                foreign_key: :cert_id,
                                inverse_of:  :certificate
end
