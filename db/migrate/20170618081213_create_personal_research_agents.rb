class CreatePersonalResearchAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_research_agents, id: false do |t|
      t.belongs_to :character,        null: false, index: true
      t.belongs_to :agent,            null: false, index: true
      t.belongs_to :skill_type,       null: false, index: true
      t.float      :points_remaining, null: false, default: 0
      t.datetime   :started,          null: false
      t.float      :points_per_day,   null: false
      
      t.index [:character_id, :agent_id]
      t.timestamps null: false
    end
    add_foreign_key :personal_research_agents, :characters, primary_key: :character_id
    add_foreign_key :personal_research_agents, :agents,     primary_key: :agent_id
    add_foreign_key :personal_research_agents, :items,      column: :skill_type_id,
                                                            primary_key: :type_id
  end
end
