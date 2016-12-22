class CreatePosts < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
    end

    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :email
      t.integer :user_id
      

      add_index :posts, :user_id
      t.timestamps null: false
    end
  end
end
