class Character < ApplicationRecord
  belongs_to :corporation
  has_many :character_assets
  has_many :bookmarks
  has_many :bookmarks_folders
  has_many :character_research_agents
  
  
  validates :name, presence: true,
                   uniqueness: true
  
end
