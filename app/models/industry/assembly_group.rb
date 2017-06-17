class AssemblyGroup < ApplicationRecord
  belongs_to :assembly_line, primary_key: :assembly_line_id,
                             inverse_of:  :assembly_groups
  belongs_to :item_group,    foreign_key: :group_id,
                             primary_key: :group_id,
                             inverse_of:  :assembly_groups
end
