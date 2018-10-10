ActiveAdmin.register Company do

  permit_params :title, :address, :email_domain # etc...

  index do
    selectable_column
    column :id
    column :title
    column :address
    column :email_domain
    column :created_at
    column :updated_at
    actions
  end

  form multipart: true do |f|
    f.inputs do
      f.input :title
      f.input :address
      f.input :email_domain
    end
    f.actions
   end

end
