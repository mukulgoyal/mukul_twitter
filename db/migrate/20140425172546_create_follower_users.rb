class CreateFollowerUsers < ActiveRecord::Migration
  def change
    create_table :follower_users, :id => false do |t|
      t.references :user, index: true
      t.references :follower, index: true

      t.timestamps
    end
  end
end
