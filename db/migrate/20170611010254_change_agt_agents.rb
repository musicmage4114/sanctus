class ChangeAgtAgents < ActiveRecord::Migration[5.1]
  class Agent < ActiveRecord::Base
  end
  
  def up
    rename_table "agtAgents", :agents
    change_table :agents do |t|
      t.rename "agentID", :agent_id
      t.rename "divisionID", :division
      t.rename "corporationID", :corporation_id
      t.rename "agentTypeID", :agent_type
      t.rename "locationID", :location_id
      t.remove_index name: "ix_agtAgents_locationID"
      t.column :location_type, :string
      t.index [:location_type, :location_id]
      t.remove "quality"
    end
    add_column :agents, :locator_agent_tmp, :integer, default: false
    
    Agent.reset_column_information
    Agent.where(isLocator: true).update_all(locator_agent_tmp: 1)
    
    remove_column :agents, :isLocator
    rename_column :agents, :locator_agent_tmp, :locator_agent
  end
  
  def down
    add_column :agents, :locator_agent_tmp, :boolean, default: false
    
    Agent.reset_column_information
    Agent.where(locator_agent: 1).update_all(locator_agent_tmp: true)
    
    change_table :agents do |t|
      t.remove :locator_agent
      t.rename :locator_agent_tmp, :isLocator
      t.rename :agent_type, :agentTypeID
      t.column :quality, :integer, default: 20
      t.remove_index column: [:location_type, :location_id]
      t.remove :location_type
      t.index :location_id, name: "ix_agtAgents_locationID"
      t.rename :location_id, :locationID
      t.rename :corporation_id, :corporationID
      t.rename :division, :divisionID
      t.rename :agent_id, :agentID
    end
    rename_table :agents, :agtAgents
  end
  
  def data
    Agent.where("location_id < ?", 40000000).update_all(location_type: 'SolarSystem')
    Agent.where("location_id > ?", 60000000).update_all(location_type: 'Station')
  end
end
