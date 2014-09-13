require 'test_helper'

class RotationMemberListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can initialize record" do 
  	assert RotationMemberList.new
  end

  test "can load valid record" do
  	assert rotation_member_lists(:one), "record not found"
  end

  test "unlisted user error" do
  	rml = rotation_member_lists(:rm_3)
  	assert_not User.find_by_id(rml.user_id), "unlisted user was found" 
  end

  test "unlisted rotation error" do
  	rml = rotation_member_lists(:six)
  	rml.rotation_id = 99
  	assert_not Rotation.find_by_id(rml.rotation_id),
  	 "unlisted rotation was found"
  end

  test "cant save with invalid user" do
  	rml = RotationMemberList.new(
  		user_id: 99,
  		rotation_id: 1,
  		instance_count: 0)
  	assert_not rml.save, "Invalid user_id saved"
  end

  test "cannot save existing user and rotation combo" do
  	rml = RotationMemberList.new(
  		user_id: 1,
  		rotation_id: 1,
  		instance_count: 0)
  	assert_not rml.save, "user_id not saved"
  	rml.rotation_id = 5
  	assert rml.save, "unique combo not saved"
  end

end
