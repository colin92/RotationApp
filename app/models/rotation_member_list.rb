class RotationMemberList < ActiveRecord::Base
  belongs_to :user
  belongs_to :rotation

  validates :user, presence: true
  validates :user_id, :rotation_id, presence: true
  validates :instance_count, presence: true
  validates :user_id, uniqueness: { scope: :rotation_id }

end
