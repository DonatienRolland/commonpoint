ActiveAdmin.register User do

  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :company
    column :created_at
    actions
  end

end
