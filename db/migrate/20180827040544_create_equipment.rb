class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :note
      t.references :participant, foreign_key: true
      t.references :point, foreign_key: true

      t.timestamps
    end
  end
end
