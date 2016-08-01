class RegistrationsController < Devise::RegistrationsController  

 	
 

 	protected

    def sign_up_params
      params.require(:player).permit(:email, :password, :password_confirmation, :first_name, :last_name, :birthday, :avatar)
    end


    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def account_update_params
      params.require(:player).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :birthday)
    end

end