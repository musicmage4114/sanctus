class AssemblyCategory < ApplicationRecord
  belongs_to :assembly_line, primary_key: :assembly_line_id,
                             inverse_of:  :assembly_categories
  belongs_to :item_category, foreign_key: :category_id,
                             primary_key: :category_id,
                             inverse_of:  :assembly_categories
end
