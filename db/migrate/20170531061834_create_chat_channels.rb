class CreateChatChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_channels, id: false do |t|
      t.integer    :channel_id,     null: false, index: { unique: true }
      t.integer    :password,       null: false, default: 0, index: true
      t.belongs_to :owner,          null: false, index: true
      t.string     :comparison_key, null: false
      t.string     :name
      t.text       :motd

      t.timestamps
    end
    add_foreign_key :chat_channels, :characters, column: :owner_id, primary_key: :character_id
  end
end
