class AssignmentsController < ApplicationController
  # GET /assignments/
  def index
    @assignments ={}
    #Assignment.where(:course_id => 1)
    
    Course.all.each do |c|
      @assignments[c] = []
        Assignment.where(:course_id => c.id).each do |s|
          @assignments[c] << Student.find(s.student_id)
        end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

end
