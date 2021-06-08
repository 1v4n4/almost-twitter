class AddUserIdToTvits < ActiveRecord::Migration[6.1]
  def change
    add_column :tvits, :user_id, :integer
  end
end
