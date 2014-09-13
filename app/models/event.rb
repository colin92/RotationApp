class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :rotation
  
  validates :user, presence: true
  validates :rotation, presence: true
  #validates :date, uniqueness: { scope: :user_id, :rotation_id }



end
