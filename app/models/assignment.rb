class Assignment < ActiveRecord::Base
  attr_accessible :course, :status, :student
  belongs_to :student
  belongs_to :course
  validates :student , :presence => true
  validates :course , :presence => true
  has_many :records 
  has_many :appointments 

  def add_record(calendar, status)
    r = Record.new(:calendar => calendar, :status=>status, :assignment => self)
    r.save
  end


  def add_appointment(time)
    if Time.parse(time) < Time.now
      return false
    end
    
    a = Appointment.new(:time => Time.parse(time), :status=>"request", :assignment => self) 
    a.save  
  end

  def required_makeup
    sum = 0
    self.records.each do |r|
      if r.status == "absent"
        sum += 2
      elsif r.status == "leave"
        sum += 1
      end
    end
    return sum
  end

  def finished_makeup
    sum = 0 
    self.appointments.each do |a|
      if a.status == 'finish'
        sum += 1
      end
    end
    return sum
  end

  def todo 
    return self.required_makeup - self.finished_makeup
  end

end
