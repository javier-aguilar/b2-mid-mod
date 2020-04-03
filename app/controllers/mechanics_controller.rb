class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    mechanic.add_ride(params[:ride]) ? flash[:success] = "Added ride!" : flash[:error] = "Ride cannot be added"
    redirect_to "/mechanics/#{mechanic.id}"
  end

end