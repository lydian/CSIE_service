class AttendenceController < ApplicationController

  def index
    @course = Course.all
  end

  def show
    @course = Course.find(params[:id]) 
    @calendar = Calendar.where(:course_id => @course.id)
    @assignments = Assignment.find_by_sql("SELECT * FROM assignments LEFT JOIN students ON students.id = assignments.student_id WHERE course_id=#{@course.id}")
    @records = {}
    @assignments.each do |a|
      @records[a.id] = {}
      @calendar.each do |c|
        @records[a.id][c.id] = Record.where("assignment_id= ? AND calendar_id=?" , a.id, c.id)
      end
    end
  end


end
