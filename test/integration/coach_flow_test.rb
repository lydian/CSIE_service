require 'test_helper'

class CoachFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "coach flow" do
    @course = Course.first
    visit attendence_index_path
    click_link "#{@course.year}-#{@course.semester}"
    assert_equal current_path, attendence_path(@course)
    
    @record = @course.records.first
    @prefix = "#{@record.assignment.id}_#{@record.calendar.id}"
    fill_in "#{@prefix}_record_status", with: "absent"
    click_button "#{@prefix}_submit"
    @record2 = @course.records.first
    assert_equal @record2.status, 'absent'
  end
end
