class Record < ActiveRecord::Base
  attr_accessible :assignment, :calendar, :status
  belongs_to :assignment
  belongs_to :calendar 
  validates :assignment, :presence => true 
  validates :calendar,   :presence => true 
  
end
