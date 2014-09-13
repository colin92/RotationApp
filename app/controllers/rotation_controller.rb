class RotationController < ApplicationController

	def index
		@rotations = Rotation.all.to_a
		puts "Rotations: "
		puts @rotations
	end

	def events
		@rotations = Rotation.all.to_a
	end

end
