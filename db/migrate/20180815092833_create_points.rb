class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :price
      t.integer :number_min
      t.integer :number_max
      t.string :address
      t.string :type_of_point
      t.integer :level_min
      t.integer :level_max

      t.timestamps
    end
  end
end
