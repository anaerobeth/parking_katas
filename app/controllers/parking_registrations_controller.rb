class ParkingRegistrationsController < ApplicationController
  def new
    @parking_registration = ParkingRegistration.new
  end

  def create
     @parking_registration = ParkingRegistration.new(params[:parking_registration])
    if @parking_registration.park
        flash[:notice] = 'You registered successfully'
        redirect_to '/'
    else
        render :new
    end
  end

  def park
    self.parked_on = Date.today
    save!
  end

  protected
  def reg_params
    params.require(:parking_registration).permit(:email, :first_name, :last_name, :spot_number)
  end
end
