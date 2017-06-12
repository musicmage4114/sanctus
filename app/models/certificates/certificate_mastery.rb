class CertificateMastery < ApplicationRecord
  belongs_to :ship,        class_name:  'Item',
                           foreign_key: :type_id,
                           inverse_of:  :certificate_masteries
  belongs_to :certificate, foreign_key: :cert_id,
                           inverse_of:  :certificate_masteries
end
