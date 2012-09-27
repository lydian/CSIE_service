require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:absent)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get index xml" do
    get :index, :format => "xml"
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get new xml" do
    get :new, :format => "xml"
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post :create, record: { assignment_id: @record.assignment_id, calendar_id: @record.calendar_id, status: @record.status }
    end

    assert_redirected_to record_path(assigns(:record))
  end
  
  test "should create record xml" do
    assert_difference('Record.count') do
      post :create, record: { assignment_id: @record.assignment_id, calendar_id: @record.calendar_id, status: @record.status }, format: "xml"
    end

    assert_response 201
  end

  test "should show record" do
    get :show, id: @record
    assert_response :success
  end
  
  test "should show record xml" do
    get :show, id: @record, format: "xml"
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @record
    assert_response :success
  end
  
  test "should update record with json" do
    put :update, id: @record, format: "json", record: { assignment_id: @record.assignment_id, calendar_id: @record.calendar_id, status: @record.status }
    assert_response 204
  end
  
  test "should update record with xml" do
    put :update, id: @record, format: "xml", record: { assignment_id: @record.assignment_id, calendar_id: @record.calendar_id, status: @record.status }
    assert_response 204
  end

  test "should update record" do
    put :update, id: @record, record: { assignment_id: @record.assignment_id, calendar_id: @record.calendar_id, status: @record.status }
    assert_redirected_to record_path(assigns(:record))
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete :destroy, id: @record
    end

    assert_redirected_to records_path
  end
  
  test "should destroy record with xml" do
    assert_difference('Record.count', -1) do
      delete :destroy, id: @record, format: "xml"
    end

    assert_response 204
  end
end
