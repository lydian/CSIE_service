class Appointment < ActiveRecord::Base
  attr_accessible :assignment, :status, :time
  belongs_to :assignment
  validates :time , :presence => true
  validates :assignment , :presence => true

  def update_status(status)
    self.status = status
    self.save
  end
end
