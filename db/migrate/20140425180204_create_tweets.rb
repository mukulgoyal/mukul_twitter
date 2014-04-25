class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      
      t.string       :tweet, limit: 160
      t.integer      :parent_id
      t.boolean      :private, default: false
      t.references   :user

      t.timestamps
    end
  end
end
