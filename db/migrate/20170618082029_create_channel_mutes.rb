class CreateChannelMutes < ActiveRecord::Migration[5.1]
  def change
    create_table :channel_mutes, id: false do |t|
      t.belongs_to :channel, null: false, index: true
      t.belongs_to :muted,   polymorphic: true, null: false, index: true
      t.datetime   :ends
      t.text       :reason
      
      t.timestamps null: false
    end
    add_foreign_key :channel_mutes, :chat_channels, column: :channel_id,
                                                    primary_key: :channel_id
  end
end
