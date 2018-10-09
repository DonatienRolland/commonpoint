ActiveAdmin.register Activity do

  permit_params :title, :category, :icon

  index do
    selectable_column
    column :id
    column :title
    column :icon
    column :category
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.inputs do
        f.input :title
        f.input :category
        f.input :icon
        f.input :icon_cache, as: :hidden
    end
    f.actions
   end


end
