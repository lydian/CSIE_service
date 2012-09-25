require 'test_helper'

class RecordTest < ActiveSupport::TestCase
    should belong_to(:assignment)
    should belong_to(:calendar)
    should validate_presence_of(:assignment)
    should validate_presence_of(:calendar)
end
