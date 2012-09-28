class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json

  before_filter :get_assignment

  def get_assignment 
    @assignment = Assignment.find(params[:assignment_id])
  end

  def index
    @appointments = @assignment.appointments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new
    @appointment.assignment = @assignment
    @appointment.status = 'request'
    @appointment.save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = @assignment.appointments.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to [@assignment, @appointment], notice: 'Appointment was successfully created.' }
        format.json { render json: [@assignment, @appointment], status: :created, location: [@assignment, @appointment] }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to [@assignment, @appointment], notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to assignment_appointments_url }
      format.json { head :no_content }
    end
  end
end
