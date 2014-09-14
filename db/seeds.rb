# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new(
	first_name: "Colin", 
	last_name: "Meret",
	email: "cvm@andrew.cmu.edu",
	password: "asdadssi",
	password_confirmation: "asdadssi"
	).save
User.new(
	first_name: "John", 
	last_name: "Jackson",
	email: "leaf@andrew.cmu.edu",
	password: "asdadssi",
	password_confirmation: "asdadssi"
	).save
User.new(
	first_name: "Groot", 
	last_name: "Tree",
	email: "tree@andrew.cmu.edu",
	password: "asdadssi",
	password_confirmation: "asdadssi"
	).save


3.times do |i|
	Rotation.new(
		name:"rot_#{i+1}", 
		user_id: i+1,
		description: "description for rot_#{i+1}",
		timeframe: "day",
		).save
	Event.create(
		date: DateTime.now + 1,
		user_id: i+1,
		rotation_id: i+1).save
	puts Event.all
	Event.create(
		date: DateTime.now + 2,
		user_id: i+1,
		rotation_id: i+1)
	puts "event created again"
	Event.create(
		date: DateTime.now + 3,
		user_id: i+1,
		rotation_id: i+1)
	puts "event created again again"
	RotationMemberList.create(
	user_id: 1,
	rotation_id: i+1,
	instance_count: 0)
		RotationMemberList.create(
	user_id: 2,
	rotation_id: i+1,
	instance_count: 0)
	RotationMemberList.create(
	user_id: 3,
	rotation_id: i+1,
	instance_count: 0)
end

puts Rotation.all.first.create_week_schedule
