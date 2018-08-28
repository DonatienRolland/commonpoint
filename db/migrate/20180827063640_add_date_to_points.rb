class AddDateToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :date, :string
  end
end
