class ParkingRegistrationsController < ApplicationController
  def new
    @last_registration = ParkingRegistration.find_by_id(session[:last_registration_id])
    @parking_registration = ParkingRegistration.new
    @parking_registration.email = @last_registration.try(:email)

  end

  def create
    @parking_registration = ParkingRegistration.new(reg_params)
    if @parking_registration.park
        session[:last_registration_id] = @parking_registration.id
        flash[:notice] = 'You registered successfully'
        redirect_to "/parking_registrations/#{@parking_registration.id}"
    else
        render :new
    end
  end

  def show
    @parking_registration = ParkingRegistration.find(params[:id])
  end

  protected
  def reg_params
    params.require(:parking_registration).permit(:email,
      :first_name,
      :last_name,
      :spot_number)
  end
end
