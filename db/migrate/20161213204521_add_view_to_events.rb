class AddViewToEvents < ActiveRecord::Migration
  def change
    add_column :events, :view, :integer
  end
end
