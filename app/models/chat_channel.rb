class ChatChannel < ApplicationRecord
  self.primary_key = 'channel_id'
  # supplied parameter: boolean - has_password
  # true -> 1 -> has_password, false -> 0 -> no_password
  enum password: [:no_password, :has_password]
  
  belongs_to :owner, class_name: 'Character', inverse_of: :chat_channels
  has_many :operators, class_name: 'ChannelOperator', inverse_of: :chat_channel
  has_many :moderators, through: :channel_operators, source: :accessor, source_type: 'Character'
  has_many :allowed, class_name: 'ChannelAllow', foreign_key: :channel_id, inverse_of: :chat_channel
  has_many :blocked, class_name: 'ChannelBlock', foreign_key: :channel_id, inverse_of: :chat_channel
  has_many :muted, class_name: 'ChannelMute', foreign_key: :channel_id, inverse_of: :chat_channel
  # TODO: has_many :banned - characters with infinite blocked time
  
  alias_attribute :allows, :allowed
  alias_attribute :kicked, :blocked
end
