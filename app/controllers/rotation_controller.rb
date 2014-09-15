class RotationController < ApplicationController

	def index
		@rotations = Rotation.all.to_a
	end

	def events
		@rotations = Rotation.all.to_a
	end

end
