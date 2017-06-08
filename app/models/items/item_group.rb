class ItemGroup < ApplicationRecord
  self.primary_key = 'group_id'

  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_category, foreign_key: :category_id, inverse_of: :item_groups
  
  has_many :members, ->(item_group) { where(group_id: item_group.group_id) },
                                    class_name: "#{group_member_class}"
  
  private
  
    def group_member_class
      self.group_type.classify
    end
end
