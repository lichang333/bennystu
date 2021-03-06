class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.integer :votes
      t.timestamps null: false
      t.references :users, foreign_key: true
    end
  end
end
