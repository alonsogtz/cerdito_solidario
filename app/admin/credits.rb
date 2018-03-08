ActiveAdmin.register Credit do

 permit_params :user_id, :amount, :group_id, :pricing, :comments, :weekly_payment, :status, :disbursement_confirmation, :disbursement_confirmation_image, :disbursement_option_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
