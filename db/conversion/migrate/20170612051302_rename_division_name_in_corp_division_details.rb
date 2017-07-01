class RenameDivisionNameInCorpDivisionDetails < ActiveRecord::Migration[5.1]
  def change
    rename_column :corp_division_details, :divisionName, :name
  end
end
