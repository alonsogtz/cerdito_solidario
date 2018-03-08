Rails.application.routes.draw do
  # Routes for the Payment_confirmation resource:
  # CREATE
  get "/payment_confirmations/new", :controller => "payment_confirmations", :action => "new"
  post "/create_payment_confirmation", :controller => "payment_confirmations", :action => "create"

  # READ
  get "/payment_confirmations", :controller => "payment_confirmations", :action => "index"
  get "/payment_confirmations/:id", :controller => "payment_confirmations", :action => "show"

  # UPDATE
  get "/payment_confirmations/:id/edit", :controller => "payment_confirmations", :action => "edit"
  post "/update_payment_confirmation/:id", :controller => "payment_confirmations", :action => "update"

  # DELETE
  get "/delete_payment_confirmation/:id", :controller => "payment_confirmations", :action => "destroy"
  #------------------------------

  # Routes for the Group resource:
  # CREATE
  get "/groups/new", :controller => "groups", :action => "new"
  post "/create_group", :controller => "groups", :action => "create"

  # READ
  get "/groups", :controller => "groups", :action => "index"
  get "/groups/:id", :controller => "groups", :action => "show"

  # UPDATE
  get "/groups/:id/edit", :controller => "groups", :action => "edit"
  post "/update_group/:id", :controller => "groups", :action => "update"

  # DELETE
  get "/delete_group/:id", :controller => "groups", :action => "destroy"
  #------------------------------

  # Routes for the Credit resource:
  # CREATE
  get "/credits/new", :controller => "credits", :action => "new"
  post "/create_credit", :controller => "credits", :action => "create"

  # READ
  get "/credits", :controller => "credits", :action => "index"
  get "/credits/:id", :controller => "credits", :action => "show"

  # UPDATE
  get "/credits/:id/edit", :controller => "credits", :action => "edit"
  post "/update_credit/:id", :controller => "credits", :action => "update"

  # DELETE
  get "/delete_credit/:id", :controller => "credits", :action => "destroy"
  #------------------------------

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
