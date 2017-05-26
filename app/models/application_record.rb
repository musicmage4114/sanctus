class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  # Class variables

  @@type_id_lookup = { self.send("#{__method__}_type").to_s.pluralize.classify.where("#{self.send("#{__method__}_type")}_id".to_sym => "#{__method__}_id".to_sym) }
end
