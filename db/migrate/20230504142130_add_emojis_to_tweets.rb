class AddEmojisToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :emojis, :boolean
  end
end
