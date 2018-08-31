class AddFullToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :full, :boolean, null: false, default: false
  end
end
