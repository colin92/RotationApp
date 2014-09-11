require 'test_helper'

class RotationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "initialize rotation" do
  	assert Rotation.new, "rotation could not be initialized"
  end

  # test "cant save with invalid user_id" do
  # 	rot = Rotation.new(user_id: 99, 
  # 		timeframe: 'week', 
  # 		description: "somthing",
  # 		name: 'somthing')
  # 	assert_not rot.save, "Invalid user"
  # end

  test "find rotation owner" do
  	rot = rotations(:one)
  	assert rot.owner == User.find(rot.user_id), "could not find owner"
  end

  test "find rotation events" do
  	rot = rotations(:one)
  	assert rot.events == [events(:one), events(:two)],
  	 "Could not find events"
  end

  test "find rotation members" do 
  	rot = rotations(:one)
  	assert rot.members, "could not find method"
  	assert rot.members == [users(:one), users(:two)], "incorrect members"
  	assert_not rot.members == [users(:three)], "incorrect member"
  end

  test "get last event" do 
  	assert rotations(:one).get_last_event == events(:two),
  	 "correct event not found"
  end

  # test "create a week of events" do
  # 	rot = rotations(:one)
  # 	week_schedule = [1,2,1,2,1,2,1]
  # 	rot_sched = rot.create_week_schedule.map {|e| e.user_id}
  # 	assert rot_sched == week_schedule.

end
