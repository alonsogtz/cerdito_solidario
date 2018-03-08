Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "personal_messages#index"
  # Routes for the Disbursement_option resource:
  # CREATE
  get "/disbursement_options/new", :controller => "disbursement_options", :action => "new"
  post "/create_disbursement_option", :controller => "disbursement_options", :action => "create"

  # READ
  get "/disbursement_options", :controller => "disbursement_options", :action => "index"
  get "/disbursement_options/:id", :controller => "disbursement_options", :action => "show"

  # UPDATE
  get "/disbursement_options/:id/edit", :controller => "disbursement_options", :action => "edit"
  post "/update_disbursement_option/:id", :controller => "disbursement_options", :action => "update"

  # DELETE
  get "/delete_disbursement_option/:id", :controller => "disbursement_options", :action => "destroy"
  #------------------------------

  # Routes for the State resource:
  # CREATE
  get "/states/new", :controller => "states", :action => "new"
  post "/create_state", :controller => "states", :action => "create"

  # READ
  get "/states", :controller => "states", :action => "index"
  get "/states/:id", :controller => "states", :action => "show"

  # UPDATE
  get "/states/:id/edit", :controller => "states", :action => "edit"
  post "/update_state/:id", :controller => "states", :action => "update"

  # DELETE
  get "/delete_state/:id", :controller => "states", :action => "destroy"
  #------------------------------

  # Routes for the Community resource:
  # CREATE
  get "/communities/new", :controller => "communities", :action => "new"
  post "/create_community", :controller => "communities", :action => "create"

  # READ
  get "/communities", :controller => "communities", :action => "index"
  get "/communities/:id", :controller => "communities", :action => "show"

  # UPDATE
  get "/communities/:id/edit", :controller => "communities", :action => "edit"
  post "/update_community/:id", :controller => "communities", :action => "update"

  # DELETE
  get "/delete_community/:id", :controller => "communities", :action => "destroy"
  #------------------------------

  # Routes for the Additional_info resource:
  # CREATE
  get "/additional_infos/new", :controller => "additional_infos", :action => "new"
  post "/create_additional_info", :controller => "additional_infos", :action => "create"

  # READ
  get "/additional_infos", :controller => "additional_infos", :action => "index"
  get "/additional_infos/:id", :controller => "additional_infos", :action => "show"

  # UPDATE
  get "/additional_infos/:id/edit", :controller => "additional_infos", :action => "edit"
  post "/update_additional_info/:id", :controller => "additional_infos", :action => "update"

  # DELETE
  get "/delete_additional_info/:id", :controller => "additional_infos", :action => "destroy"
  #------------------------------

  # Routes for the Bank resource:
  # CREATE
  get "/banks/new", :controller => "banks", :action => "new"
  post "/create_bank", :controller => "banks", :action => "create"

  # READ
  get "/banks", :controller => "banks", :action => "index"
  get "/banks/:id", :controller => "banks", :action => "show"

  # UPDATE
  get "/banks/:id/edit", :controller => "banks", :action => "edit"
  post "/update_bank/:id", :controller => "banks", :action => "update"

  # DELETE
  get "/delete_bank/:id", :controller => "banks", :action => "destroy"
  #------------------------------

  # Routes for the Payment_method resource:
  # CREATE
  get "/payment_methods/new", :controller => "payment_methods", :action => "new"
  post "/create_payment_method", :controller => "payment_methods", :action => "create"

  # READ
  get "/payment_methods", :controller => "payment_methods", :action => "index"
  get "/payment_methods/:id", :controller => "payment_methods", :action => "show"

  # UPDATE
  get "/payment_methods/:id/edit", :controller => "payment_methods", :action => "edit"
  post "/update_payment_method/:id", :controller => "payment_methods", :action => "update"

  # DELETE
  get "/delete_payment_method/:id", :controller => "payment_methods", :action => "destroy"
  #------------------------------

  # Routes for the Leader resource:
  # CREATE
  get "/leaders/new", :controller => "leaders", :action => "new"
  post "/create_leader", :controller => "leaders", :action => "create"

  # READ
  get "/leaders", :controller => "leaders", :action => "index"
  get "/leaders/:id", :controller => "leaders", :action => "show"

  # UPDATE
  get "/leaders/:id/edit", :controller => "leaders", :action => "edit"
  post "/update_leader/:id", :controller => "leaders", :action => "update"

  # DELETE
  get "/delete_leader/:id", :controller => "leaders", :action => "destroy"
  #------------------------------

  # Routes for the Group_comment resource:
  # CREATE
  get "/group_comments/new", :controller => "group_comments", :action => "new"
  post "/create_group_comment", :controller => "group_comments", :action => "create"

  # READ
  get "/group_comments", :controller => "group_comments", :action => "index"
  get "/group_comments/:id", :controller => "group_comments", :action => "show"

  # UPDATE
  get "/group_comments/:id/edit", :controller => "group_comments", :action => "edit"
  post "/update_group_comment/:id", :controller => "group_comments", :action => "update"

  # DELETE
  get "/delete_group_comment/:id", :controller => "group_comments", :action => "destroy"
  #------------------------------

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
