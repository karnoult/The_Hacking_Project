class CreateJoinTableTweetsLikers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tweets, :twitters do |t|
      # t.index [:tweet_id, :twitter_id]
      # t.index [:twitter_id, :tweet_id]
    end
  end
end
