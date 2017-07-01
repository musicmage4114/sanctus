class AddAllianceIdToRaces < ActiveRecord::Migration[5.1]
  def change
    change_table :races do |t|
      t.belongs_to :alliance, index: true
    end
    add_foreign_key :races, :alliances, primary_key: :alliance_id
  end
end
