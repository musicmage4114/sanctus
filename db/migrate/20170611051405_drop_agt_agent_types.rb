class DropAgtAgentTypes < ActiveRecord::Migration[5.1]
  def change
    drop_table "agtAgentTypes" do |t|
      t.integer :agentTypeID, null: false, index: { unique: true }
      t.string  :agentType,   limit: 50
    end
  end
end
