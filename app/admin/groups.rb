ActiveAdmin.register Group do

 permit_params :name, :community_id, :preferredp_mt_method_id, :comments, :begining_date, :end_date, :weekly_pmt, :total_principal
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
