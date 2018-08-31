class AddDateWithDateTimeToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :date, :datetime
    add_column :points, :date2, :datetime
  end
end
