class CreateChannelBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :channel_blocks, id: false do |t|
      t.belongs_to :channel, null: false, index: true
      t.belongs_to :blocked, polymorphic: true, null: false, index: true
      t.datetime   :ends
      t.text       :reason

      t.timestamps
    end
    add_foreign_key :channel_blocks, :chat_channels, column: :channel_id, primary_key: :channel_id
  end
end
