class ChangeRamInstallationTypeContents < ActiveRecord::Migration[5.1]
  def change
    rename_table :ramInstallationTypeContents, :industry_installations
    change_table :industry_installations do |t|
      t.rename :installationTypeID, :installation_type_id
      t.index :installation_type_id
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.index :assembly_line_id
      t.index [:installation_type_id, :assembly_line_id], name: 'installation_assembly_line_type_index'
    end
    add_foreign_key :industry_installations, :items, column: :installation_type_id,
                                                     primary_key: :type_id
    add_foreign_key :industry_installations, :assembly_lines, column: :assembly_line_id,
                                                              primary_key: :assembly_line_id
  end
end
