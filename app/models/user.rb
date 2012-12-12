class User
  ROLES = [:ADMIN, :MODERATOR, :REGULAR]
  include Mongoid::Document
  authenticates_with_sorcery!

  attr_accessible :username, :email, :password, :password_confirmation

  field :role, type: Symbol

  validates_length_of :password, minimum: 3, message: "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, message: "should match confirmation", :if => :password
  validates_uniqueness_of :username, message: "username #{:username} is already in use"
  validates_uniqueness_of :email, message: "email address #{:email} is already in use"


  has_many :projects
  belongs_to :project, :inverse_of => :creator

end
