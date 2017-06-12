class RenameBloodlineNameInBloodlines < ActiveRecord::Migration[5.1]
  def change
    rename_column :bloodlines, :bloodlineName, :name
  end
end
