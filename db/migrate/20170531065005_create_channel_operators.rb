class CreateChannelOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :channel_operators, id: false do |t|
      t.belongs_to :channel, null: false, index: true
      t.belongs_to :operator, polymorphic: true, null: false, index: true

      t.timestamps
    end
    add_foreign_key :channel_operators, :chat_channels, column: :channel_id, primary_key: :channel_id
  end
end
