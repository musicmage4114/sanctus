class ChangeAgtAgents < ActiveRecord::Migration[5.1]
  class Agent < ActiveRecord::Base
  end
  
  def change
    rename_table :agtAgents, :agents
    change_table :agents do |t|
      t.rename :agentID, :agent_id
      t.rename :divisionID, :division
      t.rename :corporationID, :corporation_id
      t.rename :agentTypeID, :agent_type
      t.rename :locationID, :location_id
      t.remove_index name: "ix_agtAgents_locationID"
      t.string :location_type
      t.index [:location_type, :location_id]
    end
    remove_column :agents, :quality, :integer, default: 20
  end
  
  def data
    add_column :agents, :locator_agent, :integer, default: false
  
    Agent.reset_column_information
    Agent.where(isLocator: true).update_all(locator_agent: 1)
    Agent.where("location_id < ?", 40000000).update_all(location_type: 'SolarSystem')
    Agent.where("location_id > ?", 60000000).update_all(location_type: 'Station')

    remove_column :agents, :isLocator
  end
  
  def rollback
    add_column :agtAgents, :isLocator, :boolean, default: false
  
    Agent.reset_column_information
    Agent.where(locator_agent: 1).update_all(isLocator: true)
    
    remove_column :agtAgents, :locator_agent
  end
end
