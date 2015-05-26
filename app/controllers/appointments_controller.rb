class AppointmentsController < ApplicationController

  def index
    @user = current_user
    @appointments = Appointment.all
  end

  def new
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.new
  end

  def create
    @user = current_user
    @appointment = @user.appointments.new(appointment_params.merge(user_id: @user.id))
    if @appointment.save

      flash[:notice] = "Appointment Created with #{@appointment.doctor.name}"
      redirect_to appointments_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @appointment = @user.appointments.find(params[:id])
  end

  def update
    @user = current_user
    @appointment = @user.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      flash[:notice] = "Appointment Updated with #{@appointment.doctor.name}"
      redirect_to appointments_path
    else
      render :edit
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :date)
  end
end
