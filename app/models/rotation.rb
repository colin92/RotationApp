class Rotation < ActiveRecord::Base
  has_many :users
  has_many :events
  belongs_to :user
  has_many :rotation_member_lists, inverse_of: :rotation

  validates :user_id, presence: true
  validates :name, :timeframe, :description, presence: true
  validates :timeframe, inclusion: { in: %w(day week),
  message: "%{value} is not a valid timeframe"}
  validates :name, uniqueness: true

  def owner
  	User.find(self.user_id)
  end

  def members
  	usr_ary = self.rotation_member_lists.map {|item| item.user}
  	return usr_ary.uniq
  end

  def get_last_event
  	r_events = self.events.sort {|a,b| a.date.to_date <=> b.date.to_date}	
  	return r_events.last
  end

  def create_schedule(time_frame)
  	if time_frame == "week" 
  		time_frame = 7
  	elsif time_frame == "month"
  		time_frame = 28
  	end
  	last_event = self.get_last_event.date.to_date
		rot_members = self.members.shuffle
		puts rot_members.map {|u| u.id}
		member_count = rot_members.length
		puts member_count
		schedule = []
		time_frame.times do |i|
			schedule << Event.create(
				date: last_event + (i+1),
				user_id: rot_members[i%member_count].id,
				rotation_id: self.id)
		end
		return schedule
  end

  def create_week_schedule
  	create_schedule("week")
  end

  def create_month_schedule
  	create_schedule("month")
  end

end
