class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.boolean :confirm, default: false

      t.timestamps
    end
  end
end
