ActiveAdmin.register Activity do

  index do
    selectable_column
    column :id
    column :title
    column :icon
    column :category
    column :created_at
    actions
  end

end
