require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  should belong_to(:student)
  should belong_to(:course)
  should validate_presence_of(:student)
  should validate_presence_of(:course)
  should have_many(:records)
  should have_many(:appointments)

  def setup
    @p = assignments(:lydian_fall2012)
    @c = calendars(:one)
    @yesterday = Date.yesterday.strftime("%Y-%m-%d %H:%M")
    @tomorrow = Date.tomorrow.strftime("%Y-%m-%d %H:%M")
  end

  test "each assignment should be able to add record" do
    assert @p.add_record(@c, "absent")
    assert_equal "absent", @p.records.last.status , "wrong status"
  end

  #test "if student absent in one class, he has to makeup 2 classes" do
  #  @p.add_record(@c, "absent")
  #  assert_equal 2, @p.required_makeup , "after adding an absent record, the required makeup class should be 2" 
  #end

  #test "if student ask for leaving one class, he has to makeup 1 class" do
  #  @p.add_record(@c , "leave")
  #  assert_equal 1, @p.required_makeup 
  #end

  test "student can appointment the future date for makeup course" do
    assert @p.add_appointment(@tomorrow )
    assert !@p.add_appointment(@yesterday )
  end 

  test "after student finish 1 makeup, the remained makup course will dedcuted by 1" do
    @p.add_record(@c, "absent")
    n = @p.todo
    @p.add_appointment(@tomorrow)
    a = @p.appointments 
    @p.appointments.last.update_status('finish')
    assert_equal n-1, @p.todo 
  end

end
