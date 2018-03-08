ActiveAdmin.register User do

 permit_params :email, :password, :given_name, :paternal_last_name, :maternal_last_name, :curp, :curp_image, :proof_of_adress_image, :address, :birth_day, :phone, :comments, :validation
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
