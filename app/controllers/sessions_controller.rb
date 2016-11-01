class SessionsController < Devise::SessionsController

  after_action :welcome_message, only: :create

   private

   def welcome_message


    if ((Date.today.mjd - current_player.last_sign_in_at.to_date.mjd) < 0 )
      message = 'Welcome back! It’s been 0 days since you last completed an activity. Let’s go play some tennis!'
    else 
      message = 'Welcome back! It’s been ' + (Date.today.mjd - current_player.last_sign_in_at.to_date.mjd ).to_s + ' days since you last completed an activity. Let’s go play some tennis!'
    end 

    flash[:notice] = message
   
   end
end
