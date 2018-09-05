class RemoveDate2FromPoints < ActiveRecord::Migration[5.2]
  def change
    remove_column :points, :date2
  end
end
