class RemovePerspectiveFromTweet < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :perspective, :string
  end
end
