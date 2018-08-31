class ChangeDateToPoints < ActiveRecord::Migration[5.2]
  def change
    def up
      add_column :points, :date, :datetime
      add_column :points, :date2, :datetime
    end

    def down
      remove_column :points, :date
      remove_column :points, :date2
    end
  end
end
