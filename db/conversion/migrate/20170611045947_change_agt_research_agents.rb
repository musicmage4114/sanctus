class ChangeAgtResearchAgents < ActiveRecord::Migration[5.1]
  def change
    rename_table :agtResearchAgents, :research_agent_skills
    change_table :research_agent_skills do |t|
      t.rename :agentID, :agent_id
      t.rename :typeID, :skill_type_id
      t.index :agent_id
    end
    add_foreign_key :research_agent_skills, :agents, primary_key: :agent_id
  end
end
