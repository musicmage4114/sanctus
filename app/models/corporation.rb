class Corporation < ApplicationRecord
  belongs_to :alliance
  has_many :characters
  
  validates :name, presence: true
  
end
