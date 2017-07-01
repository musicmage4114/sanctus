class ChangeSkinLicense < ActiveRecord::Migration[5.1]
  def change
    rename_table :skinLicense, :skin_licenses
    change_table :skin_licenses do |t|
      t.rename :licenseTypeID, :license_type_id
      t.rename :skinID, :skin_id
      t.index :skin_id
    end
    add_foreign_key :skin_licenses, :items, column: :license_type_id,
                                            primary_key: :type_id
  end
end
