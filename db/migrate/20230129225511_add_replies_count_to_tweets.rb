class AddRepliesCountToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :replies_count, :integer
  end
end
