class AttendenceController < ApplicationController

  def index
    @course = Course.all
  end

  def show
    @course = Course.find(params[:id]) 
    @calendar = Calendar.where(:course_id => @course.id)
    @assignments = @course.assignments
    @records = {}
    @assignments.each do |a|
      @records[a.student.id] = {}
      @calendar.each do |c|
        @records[a.student.id][c.id] = @course.find_record(a, c)
        #@records[s.id][c.id] = "#{s.id}-#{c.id}"
      end
    end
    #@records = {}
    #@students.each do |student|
     # @records[student.id] = {}
      #@calendar.each do |c|
       # @records[student.id][c.id] = Record.where("course_id = ? AND student_id = ? AND calendar_id=?" , @course.id, @student.id, c.id)
      #end
    #end
  end


end
