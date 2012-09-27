class Student < ActiveRecord::Base
  attr_accessible :account, :name
  has_many :assignments
  has_many :records, :through => :assignments
end
