class CreateMailingListSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :mailing_list_subscriptions, id: false do |t|
      t.belongs_to :mailing_list, null: false, index: true
      t.belongs_to :subscriber,   null: false, index: true
      
      t.index [:subscriber_id, :mailing_list_id], name: 'mailing_list_subscription_index'
    end
    add_foreign_key :mailing_list_subscriptions, :mailing_lists, primary_key: :mailing_list_id
    add_foreign_key :mailing_list_subscriptions, :characters,    column: :subscriber_id,
                                                 primary_key: :character_id
  end
end
