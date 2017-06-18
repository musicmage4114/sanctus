class AddTypeToDockableStructures < ActiveRecord::Migration[5.1]
  class DockableStructure < ActiveRecord::Base
  end
  def up
    add_column :dockable_structures, :type, :string
    
    DockableStructure.reset_column_information
    DockableStructure.update_all(type: 'Station')
  end
  
  def down
    remove_column :dockable_structures, :type
  end
end
