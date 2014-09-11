require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can initialize user" do
  	assert User.new, "User not Initialized"
  end

  test "user rotations" do
  	assert users(:one).rotations == [rotations(:one), rotations(:four)],
  	 "Could not find rotations"
  	end

  test "user events" do
  	usr = users(:one)
  	assert usr.events == [events(:one), events(:three)],
  	 "Could not find user events"
  	assert_not usr.events == [events(:three)]
  end

  test "saves only valid email" do
  	usr = User.new(
  		first_name: "Cheese",
  		last_name: "Head",
  		email: "",
  		password: "helpmey")
  	assert_not usr.save, "saved with blank email"
  	usr.email = "d"
  	assert_not usr.save, "saved with invalid email: d"
  	usr.email = "d@."
  	assert_not usr.save, "saved with invalid email: d@."
  	usr.email = "d@ff.f"
  	assert_not usr.save, "saved with invalid email: d@ff.f"
  	usr.email = "d@ff.com"
  	assert usr.save, "did not save valid email"
  end

  test "user is in rotations" do
  	usr = users(:one)
  	assert usr.in_rotations == [rotations(:one), rotations(:two)],
  	 "rotations not found"
  	assert_not usr.in_rotations == [rotations(:three),rotations(:four)],
  	 "wrong rotations found"
  end

end
