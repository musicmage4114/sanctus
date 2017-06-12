class ChangeCertMasteries < ActiveRecord::Migration[5.1]
  def change
    rename_table :certMasteries, :certificate_masteries
    change_table :certificate_masteries do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :masteryLevel, :mastery_level
      t.rename :certID, :cert_id
      t.index :cert_id
      t.index [:type_id, :cert_id]
    end
    add_foreign_key :certificate_masteries, :certificates, column: :cert_id,
                                                           primary_key: :cert_id
    add_foreign_key :certificate_masteries, :items,        column: :type_id,
                                                           primary_key: :type_id
  end
end
