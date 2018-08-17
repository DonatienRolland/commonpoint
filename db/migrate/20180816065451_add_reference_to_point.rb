class AddReferenceToPoint < ActiveRecord::Migration[5.2]
  def change
    add_reference :points, :user_activity, foreign_key: true
  end
end
