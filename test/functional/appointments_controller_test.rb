require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    @appointment = appointments(:one)
    @assignment = @appointment.assignment
  end

  test "should get new" do
    get :new , :assignment_id=>@assignment.id
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post :create, assignment_id: @assignment.id,  appointment: { assignment_id: @assignment.id, status: @appointment.status, time: @appointment.time }
    end

    assert_redirected_to assignment_appointment_path(@assignment, assigns(:appointment))
  end

  test "should show appointment" do
    get :show, id: @appointment, assignment_id: @assignment.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment, assignment_id: @assignment.id
    assert_response :success
  end

  test "should update appointment" do
    put :update, id: @appointment, appointment: { assignment_id: @appointment.assignment_id, status: @appointment.status, time: @appointment.time }, assignment_id: @assignment.id
    assert_redirected_to assignment_appointment_path(@assignment, assigns(:appointment))
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment, assignment_id: @assignment.id
    end

    assert_redirected_to assignment_appointments_path(@assignment)
  end
end
