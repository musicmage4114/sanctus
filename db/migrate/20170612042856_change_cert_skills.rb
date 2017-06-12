class ChangeCertSkills < ActiveRecord::Migration[5.1]
  class CertificateSkill < ActiveRecord::Base
  end
  
  def change
    rename_table :certSkills, :certificate_skills
    change_table :certificate_skills do |t|
      t.rename :certID, :cert_id
      t.index :cert_id
      t.rename :skillID, :skill_id
      t.index [:cert_id, :skill_id]
      t.rename :certLevelInt, :certificate_level
      t.rename :skillLevel, :skill_level
    end
    add_foreign_key :certificate_skills, :certificates, column: :cert_id,
                                                        primary_key: :cert_id
    add_foreign_key :certificate_skills, :items,        column: :skill_id,
                                                        primary_key: :type_id
  end
  
  def data
    add_column :certificate_skills, :level_name, :integer, index: true
    
    CertificateSkill.reset_column_information
    CertificateSkill.where(certLevelText: 'basic').update_all(level_name: 0)
    CertificateSkill.where(certLevelText: 'standard').update_all(level_name: 1)
    CertificateSkill.where(certLevelText: 'improved').update_all(level_name: 2)
    CertificateSkill.where(certLevelText: 'advanced').update_all(level_name: 3)
    CertificateSkill.where(certLevelText: 'elite').update_all(level_name: 4)
    
    remove_column :certificate_skills, :certLevelText
  end
  
  def rollback
    add_column :certificate_skills, :certLevelText, :string

    CertificateSkill.reset_column_information
    CertificateSkill.where(level_name: 0).update_all(certLevelText: 'basic')
    CertificateSkill.where(level_name: 1).update_all(certLevelText: 'standard')
    CertificateSkill.where(level_name: 2).update_all(certLevelText: 'improved')
    CertificateSkill.where(level_name: 3).update_all(certLevelText: 'advanced')
    CertificateSkill.where(level_name: 4).update_all(certLevelText: 'elite')
    
    remove_column :certificate_skills, :level_name
  end
end
