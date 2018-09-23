class AddLastNameAndPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :phone, :integer
  end
end
