class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :topic
      t.string :tone
      t.string :keywords
      t.string :hastags
      t.string :length
      t.text :tweet

      t.timestamps
    end
  end
end
