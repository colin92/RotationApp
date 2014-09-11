require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "initialize event" do
  	assert Event.new, "Event could not be Initialized"
  end


end
