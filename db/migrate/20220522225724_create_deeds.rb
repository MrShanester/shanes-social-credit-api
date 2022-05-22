class CreateDeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :deeds do |t|
      t.string :deed
      t.string :description
      t.boolean :good
      t.integer :friend_id

      t.timestamps
    end
  end
end
