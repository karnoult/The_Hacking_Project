class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :content
      t.references :author, foreign_key: {to_table: :twitters}

      t.timestamps
    end
  end
end
