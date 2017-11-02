class CreateJoinTableFollowersFollowings < ActiveRecord::Migration[5.1]
  def change
    create_join_table :followers, :followings do |t|
      # t.index [:follower_id, :following_id]
      # t.index [:following_id, :follower_id]
    end
  end
end
