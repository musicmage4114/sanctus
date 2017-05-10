class Character < ApplicationRecord
  belongs_to :corporation
  
  validates :name, presence: true
  
end
