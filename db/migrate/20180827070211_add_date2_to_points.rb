class AddDate2ToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :date2, :string
  end
end
