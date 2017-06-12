class RenameAllianceIdIdInCorporations < ActiveRecord::Migration[5.1]
  def change
    rename_column :corporations, :alliance_id_id, :alliance_id
  end
end
