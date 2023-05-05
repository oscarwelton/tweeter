class ChangeTweetToGeneratedTweet < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :tweet, :generated_tweet
  end
end
