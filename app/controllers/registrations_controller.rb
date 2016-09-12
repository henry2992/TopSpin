class RegistrationsController < Devise::RegistrationsController  

 	def edit
 		@player_medal = current_player.player_medals
 	end
 	

 	protected

    def sign_up_params
      params.require(:player).permit(:email, :password, :password_confirmation, :first_name, :last_name, :birthday, :avatar)
    end


    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def account_update_params
      params.require(:player).permit(:email, :current_password, :password, :password_confirmation, :current_password, :first_name, :last_name, :birthday, :avatar)
    end

end