class Course < ActiveRecord::Base
  attr_accessible :semester, :year
  has_many :assignments
  has_many :calendars
  has_many :students, :through => :assignments
  has_many :records, :through => :assignments

  def find_record(assignment, calendar)
    student = assignment.student
    if !self.students.try(:find, student.id) or self.students.find(student.id).records.find_by_calendar_id(calendar.id).nil?
      r = Record.new(:assignment=>assignment, :calendar=>calendar, :status=>'')
      r.save
      return r
    end
    self.students.find(student.id).records.find_by_calendar_id(calendar.id)
  end
end
