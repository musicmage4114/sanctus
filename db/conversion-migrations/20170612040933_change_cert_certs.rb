class ChangeCertCerts < ActiveRecord::Migration[5.1]
  def change
    rename_table :certCerts, :certificates
    change_table :certificates do |t|
      t.rename :certID, :cert_id
      t.rename :groupID, :group_id
    end
  end
end
