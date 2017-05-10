class Alliance < ApplicationRecord
  has_many :corporations
  
  validates :name, presence: true
  
end
