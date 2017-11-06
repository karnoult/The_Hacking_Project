class CreateJoinTableMessagesRecipients < ActiveRecord::Migration[5.1]
  def change
    create_join_table :messages, :twitters do |t|
      # t.index [:message_id, :twitter_id]
      # t.index [:twitter_id, :message_id]
    end
  end
end
