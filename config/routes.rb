Rails.application.routes.draw do
  # Routes for the Personal_message resource:
  # CREATE
  get "/personal_messages/new", :controller => "personal_messages", :action => "new"
  post "/create_personal_message", :controller => "personal_messages", :action => "create"

  # READ
  get "/personal_messages", :controller => "personal_messages", :action => "index"
  get "/personal_messages/:id", :controller => "personal_messages", :action => "show"

  # UPDATE
  get "/personal_messages/:id/edit", :controller => "personal_messages", :action => "edit"
  post "/update_personal_message/:id", :controller => "personal_messages", :action => "update"

  # DELETE
  get "/delete_personal_message/:id", :controller => "personal_messages", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
