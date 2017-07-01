class AddIndexToGroupIdInCertificates < ActiveRecord::Migration[5.1]
  def change
    add_index :certificates, :group_id
  end
end
