Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'task#index'
  get "user/index"
  get "user/edit"
  get "user/new"
  post "user/edit"
  get "user/delete"

  get "user/change_password"
  post "user/change_password"

  post "user/new"
  get "user/view"
  get "/logout" => 'user#logout'
  get "/login" => "user#login"
  post "/login" => "user#login"

  get "user/roles"

  get "user/new_role"
  get "user/edit_role"
  get "user/edit_role"
  post "user/edit_role"
  post "user/new_role"
  get "user/delete_role"
  get "user/view_role"


  get "user/user_roles"
  post "user/user_roles"

  get "task/index"
  get "task/ajax_task"
  post "task/ajax_task"

  get "task/new"
  post "task/new"

  get "task/edit"
  post "task/edit"
  
  get "task/add_comment"
  post "task/add_comment"

  get "task/view"
end
