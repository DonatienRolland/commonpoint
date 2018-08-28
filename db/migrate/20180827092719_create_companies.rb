class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :email_domain

      t.timestamps
    end
  end
end
