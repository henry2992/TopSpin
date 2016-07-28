class PagesController < ApplicationController

  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :player
  end
 
  def resource
    @resource ||= Player.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:player]
  end


  def home
  	if player_signed_in?
      redirect_to challenges_index_path
    end
  end
end
