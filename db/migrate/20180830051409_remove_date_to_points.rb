class RemoveDateToPoints < ActiveRecord::Migration[5.2]
  def change
    remove_column :points, :date
    remove_column :points, :date2
  end
end
