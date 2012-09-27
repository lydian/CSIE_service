class Calendar < ActiveRecord::Base
  attr_accessible :course_id, :date
  belongs_to :course
end
