class AddViewToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :View, :integer
  end
end
