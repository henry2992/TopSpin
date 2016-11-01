class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  

  def facebook
    # Implementaremos este método en nuestro modelo más adelante
    @player = Player.from_omniauth(request.env["omniauth.auth"])

    if @player.persisted?
      sign_in_and_redirect @player # this will throw if @user is not activated
      # set_flash_message(:notice, :success, :kind => @player.first_name ) if is_navigational_format?


      if ((Date.today.mjd - @player.last_sign_in_at.to_date.mjd) < 0 )
        message = 'Welcome back! It’s been 0 days since you last completed an activity. Let’s go play some tennis!'
      # else 
      #   message = 'Welcome back! It’s been ' + (Date.today.mjd - @player.last_sign_in_at.to_date.mjd ) + ' days since you last completed an activity. Let’s go play some tennis!'
      end 


      flash[:notice] = message

    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except('extra')
      redirect_to new_player_registration_url
    end

  end

  def failure
    redirect_to root_path
  end




end


