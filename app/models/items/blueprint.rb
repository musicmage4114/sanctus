class Blueprint < Item
  has_many :personal_blueprints, foreign_key: :type_id, inverse_of: :blueprint
end
