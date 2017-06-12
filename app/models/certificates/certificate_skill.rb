class CertificateSkill < ApplicationRecord
  enum level_name: [:basic, :standard, :improved, :advanced, :elite]
  
  belongs_to :certificate, foreign_key: :cert_id, inverse_of: :certificate_skills
  belongs_to :skill,       class_name: 'Item',    inverse_of: :certificate_skills
end
