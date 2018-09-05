class AddReferenceGroupToPoints < ActiveRecord::Migration[5.2]
  def change
    add_reference :points, :point_group, foreign_key: true
  end
end
