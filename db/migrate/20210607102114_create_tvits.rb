class CreateTvits < ActiveRecord::Migration[6.1]
  def change
    create_table :tvits do |t|
      t.text :tvit

      t.timestamps
    end
  end
end
