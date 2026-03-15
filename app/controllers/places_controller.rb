class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
      @entries = Entry.where({ 
        "place_id" => @place["id"], 
        "user_id" => @current_user.id 
      })
    else
      # Optional: if not logged in, they shouldn't see any entries
      redirect_to "/login"
  end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
