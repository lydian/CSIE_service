require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  should belong_to(:assignment)
  should validate_presence_of(:time)
  should validate_presence_of(:assignment)
end
