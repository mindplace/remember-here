class PlacesController < ApplicationController
  def create
    @place = Place.new(place_params)

    if @place.save
      @list = List.find_by(id: list_params[:list_id])

      @list_place = ListPlace.new(list_place_params)
      @list_place.list = @list
      @list_place.place = @place
      @list_place.save

      @list.list_places << @list_place

      redirect_to "/users/#{@list.user.id}/lists/#{@list.id}"
    end
  end

  private

  def place_params
    params.require(:list_place).permit(:address, :website, :title)
  end

  def list_place_params
    params.require(:list_place).permit(:notes)
  end

  def list_params
    params.require(:list_place).permit(:list_id)
  end

end
