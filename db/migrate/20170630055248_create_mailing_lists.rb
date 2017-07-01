class CreateMailingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :mailing_lists, id: false do |t|
      t.integer    :mailing_list_id, null: false, index: { unique: true }
      t.belongs_to :creator,         index: true
      t.string     :name
    end
    add_foreign_key :mailing_lists, :characters, column: :creator_id,
                                                 primary_key: :character_id
  end
end
