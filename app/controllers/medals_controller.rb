class MedalsController < ApplicationController
  def index
  	@medals = Medal.all
  end
end
