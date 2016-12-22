class AddViewToPins < ActiveRecord::Migration
  def change
    add_column :pins, :view, :integer
  end
end
