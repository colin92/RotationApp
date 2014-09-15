require 'test_helper'

class RotationControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "index" do
  	get(:index, {'current_user' => User.all.first})
  	assert :success, "could not find index"
  end

end
