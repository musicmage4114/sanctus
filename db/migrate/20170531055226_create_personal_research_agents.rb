class CreatePersonalResearchAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_research_agents, id: false do |t|
      t.belongs_to :character, null: false, index: true
      t.belongs_to :agent, null: false, index: true
      t.belongs_to :skill_type, null: false, index: true
      t.datetime :started, null: false
      t.float :points_per_day, null: false
      t.float :points_remaining, null: false, default: 0
      t.index [:character_id, :agent_id]

      t.timestamps
    end
    add_foreign_key :personal_research_agents, :characters, primary_key: :character_id
  end
end
