class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rotations
  has_many :events
  has_many :rotation_member_lists, inverse_of: :user


  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z][a-zA-Z]+\z/, 
  message: "" }
  validates :email, format: { 
  with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, 
  message: "Please enter a valid email" }
  validates :email, uniqueness: true
  validates :email, confirmation: true, on: :create
  validates :password, confirmation: true, length: { minimum: 6 }

  def in_rotations
    self.rotation_member_lists.map {|r| r.rotation }
  end

  def get_future_events
    self.events.select {|e| ( e.date.to_date <=> Date.today ) == 1 ? true : false }
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end


def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(first_name: data["name"].split(" ").first,
          last_name: data["name"].split(" ").last,
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end

end
