ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation

  actions :all, :except => [:new, :created, :destroy, :edit, :update]

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :created_at
    actions
  end

  show do |user|
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :created_at
    end
    active_admin_comments
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at

end
