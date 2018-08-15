class AddReferenceToPoints < ActiveRecord::Migration[5.2]
  def change
    add_reference :points, :user, foreign_key: true
  end
end
