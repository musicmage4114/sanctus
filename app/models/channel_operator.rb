class ChannelOperator < ApplicationRecord
  belongs_to :chat_channel, foreign_key: :channel_id, inverse_of: :channel_operators
  belongs_to :accessor, polymorphic: true
  
  alias_attribute :channel, :chat_channel
end
